import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        CuidapetTextFormField(
          label: 'Login',
        ),
        const SizedBox(
          height: 10,
        ),
        CuidapetTextFormField(
          label: 'Senha',
          obscureText: true,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: 58,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Entrar'),
          ),
        )
      ],
    );
  }
}
