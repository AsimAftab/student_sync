import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class SignupState {
  final bool termsAccepted;
  final bool isPasswordVisible;
  final String? errorMessage;
  final String? emailError;
  final String? passwordError;
  final Country selectedCountry;
  final TextEditingController usernameController;
  final TextEditingController fullNameController;
  final TextEditingController collegeNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPassController;
  final TextEditingController phoneController;
  final GlobalKey<FormState> signupFormKey;

  SignupState({
    this.termsAccepted = false,
    this.isPasswordVisible = false,
    this.errorMessage,
    this.emailError,
    this.passwordError,
    required this.selectedCountry,
    required this.usernameController,
    required this.fullNameController,
    required this.collegeNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPassController,
    required this.phoneController,
    required this.signupFormKey,
  });

  SignupState copyWith({
    bool? termsAccepted,
    bool? isPasswordVisible,
    String? errorMessage,
    String? emailError,
    String? passwordError,
    Country? selectedCountry,
    TextEditingController? usernameController,
    TextEditingController? fullNameController,
    TextEditingController? collegeNameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPassController,
    TextEditingController? phoneController,
    GlobalKey<FormState>? signupFormKey,
  }) {
    return SignupState(
      termsAccepted: termsAccepted ?? this.termsAccepted,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      errorMessage: errorMessage ?? this.errorMessage,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      usernameController: usernameController ?? this.usernameController,
      fullNameController: fullNameController ?? this.fullNameController,
      collegeNameController: collegeNameController ?? this.collegeNameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmPassController: confirmPassController ?? this.confirmPassController,
      phoneController: phoneController ?? this.phoneController,
      signupFormKey: signupFormKey ?? this.signupFormKey,

    );
  }
}


