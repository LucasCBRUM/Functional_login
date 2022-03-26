import 'dart:convert';

class GlobalUserModel {
  GlobalUserModel({
    required this.name,
    required this.email,
    required this.token,
  });

  String name;
  String email;
  String token;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'token': token,
    };
  }

  factory GlobalUserModel.fromMap(Map<String, dynamic> map) {
    return GlobalUserModel(
      name: map['name'],
      email: map['email'],
      token: map['token'],
    );
  }

  void copyFromMap(Map<String, dynamic> map) {
    name = map['name'] ?? name;
    email = map['email'] ?? email;
    token = map['token'] ?? token;
  }

  String toJson() => json.encode(toMap());
}
