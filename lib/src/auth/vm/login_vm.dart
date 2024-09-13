import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_vm.g.dart';


@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  void build() {
    // Initialize any state or perform setup here if needed
  }

  // Define text editing controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void setUsername(String value) {
    usernameController.text = value;
  }

  void setPassword(String value) {
    passwordController.text = value;
  }

  Future<void> login() async {
    // Placeholder login logic
    if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      // Simulate login operation
      await Future.delayed(const Duration(seconds: 1));
      // Handle login logic here
    }
  }
}
