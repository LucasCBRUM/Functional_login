import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_request_model.dart';
import 'user_model.dart';

enum AuthState { idle, success, error, loading }

class AuthController extends ChangeNotifier {
  AuthState state = AuthState.idle;

  Future<void> loginAction2(
    AuthRequestModel authRequest, {
    required GlobalUserModel user,
    VoidCallback? onSuccess,
    VoidCallback? onError,
  }) async {
    try {
      final response = await Dio()
          .post('http://10.0.2.2:8080/auth', data: authRequest.toMap());
      debugPrint(response.toString());
      final shared = await SharedPreferences.getInstance();
      user.copyFromMap(jsonDecode(response.data));
      await shared.setString('UserModel', user.toJson());
      //debugPrint(user.toJson().toString());
      onSuccess?.call();
    } catch (e) {
      //debugPrint('$e');
      onError?.call();
    }
  }
}

class UserModel {
  final String name;
  final String email;
  final String token;

  UserModel({
    this.name = '',
    this.email = '',
    this.token = '',
  });
}
