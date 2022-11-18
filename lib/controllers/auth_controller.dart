import 'package:chatwithfirebase/services/auth.dart';
import 'package:chatwithfirebase/utilities/enums.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String name;
  String email;
  String password;
  AuthFormType authFormType;

  AuthController({
    required this.auth,
    this.name = '',
    this.email = '',
    this.password = '',
    this.authFormType = AuthFormType.login,
  });

  void updateName(String name) => copyWith(name: name);

  void updateEmail(String email) => copyWith(email: email);

  void updatePassword(String password) => copyWith(password: password);

  void updateAuthFormType({required AuthFormType authFormType}) => copyWith(
        authFormType: authFormType,
        email: '',
        name: '',
        password: '',
      );

  void copyWith({String? name, String? email, String? password, AuthFormType? authFormType}) {
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }

  Future<void> submit() async {
    try {
      if (authFormType == AuthFormType.login) {
        await auth.loginWithEmailAndPassword(email: email, password: password);
      } else {
        await auth.registerWithEmailAndPassword(email: email, password: password);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await auth.logOut();
    } catch (e) {
      rethrow;
    }
  }
}
