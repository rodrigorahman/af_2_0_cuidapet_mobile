import 'package:cuidapet_mobile/app/core/helpers/logger.dart';
import 'package:cuidapet_mobile/app/core/rest_client/dio_rest_client.dart';
import 'package:cuidapet_mobile/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_mobile/app/modules/core/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore(), export: true),
    Bind.factory<RestClient>((i) => DioRestClient(), export: true),
    Bind.lazySingleton<Logger>((i) => LoggerImpl(), export: true),
  ];
}
