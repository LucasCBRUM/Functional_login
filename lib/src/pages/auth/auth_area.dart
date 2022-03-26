import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/auth/auth_controller.dart';
import '../../model/auth/auth_request_model.dart';
import '../../model/auth/user_model.dart';

class CustomSafeArea extends StatefulWidget {
  const CustomSafeArea({
    Key? key,
    required this.color,
    required this.authRequest,
  }) : super(key: key);

  final Color color;
  final AuthRequestModel authRequest;

  @override
  State<CustomSafeArea> createState() => _CustomSafeAreaState();
}

class _CustomSafeAreaState extends State<CustomSafeArea> {
  late AuthRequestModel authRequest;
  final controller = AuthController();

  @override
  void initState() {
    super.initState();
    authRequest = widget.authRequest;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final _ = context.watch<AuthController>();

    return SafeArea(
      child: Center(
        child: SizedBox(
          height: screenSize.height * 0.5 > 400 ? screenSize.height * 0.5 : 400,
          width: screenSize.width * 0.7 > 500 ? screenSize.width * 0.7 : 500,
          child: Card(
            color: widget.color,
            elevation: 10,
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox.square(
                        dimension: 90,
                        child: Card(
                          color: Colors.white70,
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 70,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("User:"),
                          hintText: ('user@email.com'),
                        ),
                        onChanged: (value) {
                          authRequest = authRequest.copyWith(email: value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Builder(
                        builder: (context) {
                          return TextFormField(
                            validator: (senha) {
                              if ((senha?.length ?? 0) < 3) {
                                return 'senha menor que 3 digitos';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              label: Text("Password:"),
                              hintText: ('*************'),
                            ),
                            onEditingComplete: () => check(context),
                            onChanged: (value) {
                              authRequest =
                                  authRequest.copyWith(password: value);
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Builder(builder: (context) {
                        return Consumer<AuthController>(
                            builder: (context, controller, child) {
                          return ElevatedButton(
                            //backgroundColor: ,
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                            onPressed: controller.state == AuthState.loading
                                ? null
                                : () => check(context),
                            child: FractionallySizedBox(
                              widthFactor: 0.4,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        color: Colors.lightGreen[600],
                                      ),
                                    ),
                                    const Flexible(
                                      flex: 12,
                                      child: Center(
                                        child: Text(
                                          'Login',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void check(BuildContext context) {
    final user = context.read<GlobalUserModel>();
    final valido = Form.of(context)?.validate() ?? false;
    if (valido) {
      controller.loginAction2(
        authRequest,
        user: user,
        onError: () {
          debugPrint('Erro');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erro na autenticação'),
            ),
          );
        },
        onSuccess: () {
          debugPrint('Sucesso');
          final navigator = Navigator.of(context);
          navigator.pushReplacementNamed('/home');
        },
      );
      debugPrint('LoginAction');
    }
  }
}


               /*const Padding(
                      padding: EdgeInsets.all(8.0),
                       
                      child: Builder(builder: (context) {
                        return Consumer<AuthController>(
                            builder: (context, controller, child) {
                          return  ElevatedButton(
                            //backgroundColor: ,
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                            onPressed: controller.state == AuthState.loading
                                ? null
                                : () {
                                    final valido = Form.of(context)!.validate();
                                    //controller.loginAction(authRequest);
                                    if (valido) {
                                      controller.loginAction2(
                                        authRequest,
                                        onError: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content:
                                                  Text('Erro na autenticação'),
                                            ),
                                          );
                                        },
                                        onSuccess: () {
                                          final navigator =
                                              Navigator.of(context);
                                          navigator
                                              .pushReplacementNamed('/home');
                                        },
                                      );
                                      debugPrint('LoginAction');
                                    }
                                  },
                            child: FractionallySizedBox(
                              widthFactor: 0.4,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        color: Colors.lightGreen[600],
                                      ),
                                    ),
                                    const Flexible(
                                      flex: 12,
                                      child: Center(
                                        child: Text(
                                          'Login',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                      }),
                    )*/