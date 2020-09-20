import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:test_app/apps/delivery_theming/domain/exception/auth_exception.dart';
import 'package:test_app/apps/delivery_theming/domain/repository/api_repository.dart';
import 'package:test_app/apps/delivery_theming/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';
import 'package:test_app/apps/delivery_theming/domain/request/login_request.dart';

enum LoginState {
  loading,
  initial
}

class LoginController extends GetxController{
  LoginController({this.localRepositoryInterface, this.apiRepositoryInterface});
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
 
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  var loginState = LoginState.initial.obs;

  Future<bool> login() async{
    final username = usernameTextController.text;
    final password = passwordTextController.text;

    try {
      loginState(LoginState.loading);
      final loginResponse = await apiRepositoryInterface.login(LoginRequest(username, password));
      await localRepositoryInterface.saveToken(loginResponse.token);
      await localRepositoryInterface.saveUser(loginResponse.user);
      return true;
    } on AuthException catch (_) {
      loginState(LoginState.initial);
      return false;
    }
  }
}