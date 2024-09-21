import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_sync/extension/theme_extension.dart';
import 'package:student_sync/src/auth/vm/login_vm.dart';
import 'package:student_sync/widget/custom_button.dart';
import 'package:student_sync/widget/custom_text_field.dart';



class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginViewModelProvider);
    final vm = ref.watch(loginViewModelProvider.notifier);

    // Listen to state changes and show SnackBar if there is an error message
/*    ref.listen<LoginState>(loginViewModelProvider, (previous, state) {
      if (state.errorMessage != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        });
      }
    });*/

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: vm.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 280.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: SizedBox(
                        height: 280.h,
                        width: 240.w,
                        child: SvgPicture.asset(
                          'assets/images/login_left.svg',
                          semanticsLabel: 'Login Illustration',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.h,
                      right: 0,
                      child: SizedBox(
                        height: 280.h,
                        width: 160.w,
                        child: SvgPicture.asset(
                          'assets/images/login_right.svg',
                          semanticsLabel: 'Login Illustration',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20.h,
                      right: -120.w,
                      child: SizedBox(
                        height: 300.h,
                        width: 500.w,
                        child: Image.asset('assets/images/Avatar.png'),
                      ),
                    ),
                    Positioned(
                      top: 150.h,
                      left: 40.w,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.sp,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                "Hi, Welcome Back!👋",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: PrimaryTextField(
                  prefixIcon: Icons.email,
                  hintText: "Email Address",
                  hasFocusBorder: true,
                  controller: vm.emailController,
               //   errorText: loginState.emailError,
                  // Pass emailError
                  autofillHints: const [AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => vm.validateEmail(value),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: PrimaryTextField(
                  prefixIcon: Icons.lock_outline_rounded,
                  hintText: "Password",
                  hasFocusBorder: true,
                  controller: vm.passwordController,
                  autofillHints: const [AutofillHints.password],
                  obscureText: !loginState.isPasswordVisible,
                  //errorText: loginState.passwordError,
                  // Pass passwordError
                  suffixWidget: IconButton(
                    icon: Icon(
                      loginState.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off_sharp,
                    ),
                    onPressed: () {
                      vm.togglePasswordVisibility();
                    },
                  ),
                  validator: (value) => vm.validatePassword(value),
                ),
              ),
              SizedBox(
                height: 8.h,
                width: 5.w,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  // Adjust this value as needed
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'forgetPassword');
                    },
                    child: Text(
                      'Forget Password?',
                      style: context.theme.textTheme.bodySmall!.copyWith(
                        color: const Color(0xFF37AFFA),
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              PrimaryButton(
                  onPressed: () async => await vm.login(), label: 'Login'),
              SizedBox(height: 40.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Do not have an Account? ',
                    style: context.theme.textTheme.bodySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  InkWell(
                    onTap: () {
                      /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));*/
                    },
                    child: Text(
                      "Signup",
                      style: context.theme.textTheme.bodySmall!.copyWith(
                        shadows: [
                          Shadow(
                            color: context.theme.primaryColor,
                            offset: const Offset(0, -1),
                          )
                        ],
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF37AFFA),
                        //  decoration: TextDecoration.underline,
                        decorationColor: context.theme.primaryColor,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
