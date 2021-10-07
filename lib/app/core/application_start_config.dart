
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ApplicationStartConfig {
  
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _firebaseConfig();
  }

  Future<void> _firebaseConfig() async {
    await Firebase.initializeApp();
  }

}