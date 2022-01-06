import 'package:cuidapet_mobile/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/messages.dart';
import 'package:cuidapet_mobile/app/modules/core/auth/auth_store.dart';
import 'package:dio/dio.dart';

import 'package:cuidapet_mobile/app/core/helpers/logger.dart';
import 'package:cuidapet_mobile/app/core/local_storages/local_security_storage.dart';
import 'package:cuidapet_mobile/app/core/local_storages/local_storage.dart';
import 'package:flutter/foundation.dart';

class AuthInterceptor extends Interceptor {
  final LocalStorage _localStorage;
  final LocalSecurityStorage _localSecurityStorage;
  final Logger _log;
  final RestClient _restClient;
  final AuthStore _authStore;

  AuthInterceptor({
    required LocalStorage localStorage,
    required LocalSecurityStorage localSecurityStorage,
    required Logger log,
    required RestClient restClient,
    required AuthStore authStore,
  })  : _localStorage = localStorage,
        _localSecurityStorage = localSecurityStorage,
        _log = log,
        _restClient = restClient,
        _authStore = authStore;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra['auth_required'] == true) {
      final accessToken =
          await _localStorage.read<String>(Constants.ACCESS_TOKEN_KEY);
      if (accessToken == null) {
        // Logout!!!
        handler.reject(
          DioError(
              requestOptions: options,
              error: 'Expire Token',
              type: DioErrorType.cancel),
        );
      }
      options.headers['Authorization'] = accessToken;
    }

    if (!kReleaseMode) {
      _log.append('################## Request LOG ################ ');
      _log.append('url: ${options.uri}');
      _log.append('method: ${options.method}');
      _log.append('data: ${options.data}');
      _log.append('headers: ${options.headers}');
      _log.append('################## Request LOG ################ ');
      _log.closeAppend();
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!kReleaseMode) {
      _log.append('################## Response LOG ################ ');
      _log.append('data: ${response.data}');
      _log.append('################## Response LOG ################ ');
      _log.closeAppend();
    }

    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    _log.append('################## Error LOG ################ ');
    _log.append('Response error: ${err.response}');

    if (err.requestOptions.extra['auth_required'] == true) {
      final statusCode = err.response?.statusCode;
      if (statusCode == 403 || statusCode == 401) {
        // processo de refreshToken
        await _refreshToken();
        _log.append(
            '################## Access Token Atualizado ################ ');
        _log.closeAppend();
        return _retryRequest(err, handler);
      }
    }
    _log.append('################## Error LOG ################ ');
    _log.closeAppend();
    handler.next(err);
  }

  Future<void> _refreshToken() async {
    try {
      final refreshToken =
          await _localSecurityStorage.read(Constants.REFRESH_TOKEN_KEY);

      final response = await _restClient.auth().put('/auth/refresh', data: {
        'refresh_token': refreshToken,
      });

      await _localStorage.write<String>(
          Constants.ACCESS_TOKEN_KEY, response.data['access_token']);

      await _localSecurityStorage.write(
          Constants.REFRESH_TOKEN_KEY, response.data['refresh_token']);
    } catch (e, s) {
      _log.error('Erro ao atualizar o accessToken', e, s);
      _loginExpire();
    }
  }

  void _loginExpire() {
    _authStore.logout();
    Future.delayed(const Duration(milliseconds: 500),
        () => Messages.alert('Login Expirado'));
  }

  Future<void> _retryRequest(
      DioError err, ErrorInterceptorHandler handler) async {
    try {
      _log.info('################# Retry Request ##################');
      final requestOptions = err.requestOptions;
      
      final result = await _restClient.request(
        requestOptions.path,
        method: requestOptions.method,
        data: requestOptions.data,
        headers: requestOptions.headers,
        queryParameters: requestOptions.queryParameters,
      );
      
      handler.resolve(Response(
        requestOptions: requestOptions,
        data: result.data,
        statusCode: result.statusCode,
        statusMessage: result.statusMessage
      ));
    } on DioError catch (e, s) {
      _log.error('Erro ao refaz request', e, s);
      handler.reject(e);
    }
  }
}
