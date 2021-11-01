import 'package:cuidapet_mobile/app/core/exceptions/failure.dart';
import 'package:cuidapet_mobile/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile/app/core/helpers/logger.dart';
import 'package:cuidapet_mobile/app/core/local_storages/local_security_storage.dart';
import 'package:cuidapet_mobile/app/core/local_storages/local_storage.dart';
import 'package:cuidapet_mobile/app/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final Logger _log;
  final LocalStorage _localStorage;
  final LocalSecurityStorage _localSecurityStorage;

  UserServiceImpl(
      {required UserRepository userRepository,
      required Logger log,
      required LocalStorage localStorage,
      required LocalSecurityStorage localSecurityStorage})
      : _userRepository = userRepository,
        _log = log,
        _localStorage = localStorage,
        _localSecurityStorage = localSecurityStorage;

  @override
  Future<void> register(String email, String password) async {
    try {
      await _userRepository.register(email, password);
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e, s) {
      _log.error('Erro ao criar usuário no FirebaseAuth', e, s);
      throw Failure(message: 'Erro ao criar usuário no FirebaseAuth');
    }
  }

  @override
  Future<void> login(String login, String password) async {
    try {
      final accessToken = await _userRepository.login(login, password);
      _log.info('AccessToken: $accessToken');
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: login, password: password);
      await _saveAccessToken(accessToken);
      await _confirmLogin();
      _log.info('Login realizado com sucesso');
    } on FirebaseAuthException catch (e, s) {
      _log.error('Erro ao fazer login no Firebase Auth', e, s);
      throw Failure(message: 'Erro ao fazer login no Firebase');
    }
  }

  Future<void> _saveAccessToken(String accessToken) =>
      _localStorage.write<String>(Constants.ACCESS_TOKEN_KEY, accessToken);

  Future<void> _confirmLogin() async {
    final confirmModel = await _userRepository.confirmLogin();
    await _saveAccessToken(confirmModel.accessToken);
    await _localSecurityStorage.write(
        Constants.REFRESH_TOKEN_KEY, confirmModel.refreshToken);
  }
}
