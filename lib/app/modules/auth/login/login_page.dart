import 'package:cuidapet_mobile/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/login_controller.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/widget/login_form.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/widget/login_register_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(top: 1.statusBarHeight + 30, left: 20, right: 20),
        width: 1.sw,
        height: 1.sh,
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150.w,
              fit: BoxFit.fill,
            ),
            const LoginForm(),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: context.primaryColor,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ou',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: context.primaryColor),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: context.primaryColor,
                    thickness: 1,
                  ),
                )
              ],
            ),
            LoginRegisterButtons(
              loginController: controller,
            )
          ],
        ),
      ),
    ));
  }
}
