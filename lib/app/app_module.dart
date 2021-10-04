import 'package:cuidapet_mobile/app/modules/auth/auth_module.dart';
import 'package:cuidapet_mobile/app/modules/core/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {

   @override
   final List<Bind> binds = [

   ];

   @override
  List<Module> get imports => [
    CoreModule()
  ];

   @override
   final List<ModularRoute> routes = [
     ModuleRoute('/auth', module: AuthModule()),
     ModuleRoute('/home', module: HomeModule())
   ];

}