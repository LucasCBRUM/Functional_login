import 'package:flutter/material.dart';
import '../../model/auth/auth_controller.dart';
import '../../model/auth/user_model.dart';
import '../auth/auth.dart';
import '../splash.dart';
import 'package:provider/provider.dart';

import '../home/home.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => GlobalUserModel(
            email: '',
            name: '',
            token: '',
          ),
        ),
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(),
          initialRoute: '/',
          routes: {
            '/': (_) => const SplashPage(),
            '/auth': (_) => const AuthPage(),
            '/home': (_) => const HomePage(),
          },
        );
      },
    );
  }
}
