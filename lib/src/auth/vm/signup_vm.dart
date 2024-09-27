import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_sync/src/auth/model/signup_state.dart';

part 'signup_vm.g.dart';

@riverpod
class SignupViewModel extends _$SignupViewModel {
  @override
  SignupState build() {
    return SignupState(
      selectedCountry: Country(
        phoneCode: "+977",
        countryCode: "NP",
        name: "Nepal",
        displayName: "Nepal",
        displayNameNoCountryCode: "Nepal (NP)",
        e164Sc: 0,
        geographic: true,
        level: 1,
        example: "9841234567",
        e164Key: '977-NP-0',
      ),
      usernameController: TextEditingController(),
      fullNameController: TextEditingController(),
      collegeNameController: TextEditingController(),
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      confirmPassController: TextEditingController(),
      phoneController: TextEditingController(),
      signupFormKey: GlobalKey<FormState>(),
    ); // Initializing the state with default values
  }


  void setSelectedCountry(Country country) {
    state = state.copyWith(selectedCountry: country);
  }

  String? validateEmail(String? value) {
    const emailPattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    final regex = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    } else if (!regex.hasMatch(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    return null;
  }

  Future<void> signup() async {
    if (state.signupFormKey.currentState?.validate() ?? false) {
      // Form is valid; simulate a successful login action here
      /*    state = state.copyWith(
        emailError: null,
        passwordError: null,
        errorMessage: null,
      );*/
      print("Login successful");
    } else {
      // Form is invalid; update state to show errors
      /* state = state.copyWith(
        emailError: validateEmail(emailController.text),
        passwordError: validatePassword(passwordController.text),
        errorMessage: "Please fill in all fields correctly",
      );*/
      print("Login failed. One or more fields are invalid.");
    }
  }

// Method to toggle terms acceptance
  void toggleTermsAccepted() {
    state = state.copyWith(
        termsAccepted: !(state.termsAccepted)); // Proper state update
  }
}
/* Manual Dispose Not required as it is handle by RiverPod AutoDispose
  void dispose()
  {
    state.usernameController.dispose();
    state.fullNameController.dispose();
    state.collegeNameController.dispose();
    state.emailController.dispose();
    state.passwordController.dispose();
    state.confirmPassController.dispose();

  }
}
*/
