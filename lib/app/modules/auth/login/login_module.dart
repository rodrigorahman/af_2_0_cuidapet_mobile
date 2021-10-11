import 'package:cuidapet_mobile/app/modules/auth/login/login_controller.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginController(userService: i(), log: i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage())
  ];
}
