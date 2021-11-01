import 'package:cuidapet_mobile/app/core/helpers/environments.dart';
import 'package:cuidapet_mobile/app/core/push_notification/push_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ApplicationStartConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _firebaseConfig();
    await _loadEnvs();
    await _pushNotification();
  }

  Future<void> _firebaseConfig() async => await Firebase.initializeApp();

  Future<void> _loadEnvs() => Environments.loadEnvs();

  Future<void> _pushNotification() => PushNotification().configure();
}
