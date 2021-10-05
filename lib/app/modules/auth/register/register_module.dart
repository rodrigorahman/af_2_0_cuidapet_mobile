import 'package:cuidapet_mobile/app/modules/auth/register/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const RegisterPage(),
    )
  ];
}
