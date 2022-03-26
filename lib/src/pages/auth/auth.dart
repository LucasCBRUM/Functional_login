import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import '../../model/auth/auth_controller.dart';
import '../../model/auth/auth_request_model.dart';
import 'auth_area.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthRequestModel authRequest = AuthRequestModel('', '');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        late final controller = context.read<AuthController>();
        controller.addListener(
          () {
            if (controller.state == AuthState.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Erro na autenticação'),
                ),
              );
            } else if (controller.state == AuthState.success) {
              Navigator.of(context).pushReplacementNamed('/home');
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('REBUILD');

    final color = Colors.cyan[50]!;
    return Scaffold(
      appBar: MyappBar(),
      endDrawer: const Mydrawer(),
      backgroundColor: color,
      body: CustomSafeArea(
        color: color,
        authRequest: authRequest,
      ),
    );
  }
}

/*  @override
  Widget build(BuildContext context) {
    final color = Colors.cyan[50]!;
    return Scaffold(
      appBar: MyappBar(),
      endDrawer: const Mydrawer(),
      
    );
  }
}*/