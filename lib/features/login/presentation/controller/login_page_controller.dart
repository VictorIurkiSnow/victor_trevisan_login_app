import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:victor_trevisan_login_app/core/services/auth_services.dart';

class LoginPageController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;
  RxBool isObscure = true.obs;
  RxString errorMessage = ''.obs;

  Future<bool> login({required String email, required String password}) async {
    isLoading.value = true;
    try {
      final response =
          await AuthServices.login(email: email, password: password);
      if (response.hasError) {
        throw response.error!;
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      errorMessage.value = e.toString();
      hasError.value = true;
      return false;
    } finally {
      isLoading.value = false;     
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu e-mail';
    }
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Formato de e-mail inválido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira sua senha';
    }
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }
}
