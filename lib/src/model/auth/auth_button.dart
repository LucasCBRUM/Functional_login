import 'package:flutter/material.dart';

import 'auth_controller.dart';
import 'auth_request_model.dart';

class AuthButton extends StatefulWidget {
  const AuthButton({Key? key}) : super(key: key);

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  // ignore: recursive_getters
  AuthRequestModel? get authRequest => authRequest;

  @override
  Widget build(BuildContext context) {
    final controller = AuthController();
    return ElevatedButton(
      onPressed: controller.state == AuthState.loading
          ? null
          : () {
              //controller.loginAction(authRequest!);
            },
      child: const Text('login'),
    );
  }
}
