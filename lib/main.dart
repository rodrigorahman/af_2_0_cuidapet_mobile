import 'package:cuidapet_mobile/app/app_widget.dart';
import 'package:cuidapet_mobile/app/core/application_start_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';

Future<void> main() async {
  await ApplicationStartConfig().configureApp();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
