import 'package:cuidapet_mobile/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class AuthHomePage extends StatefulWidget {
  const AuthHomePage({Key? key}) : super(key: key);

  @override
  _AuthHomePageState createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 162.w,
          height: 130.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
