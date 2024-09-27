import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_sync/const/app_colors.dart';
import 'package:student_sync/extension/theme_extension.dart';
import 'package:student_sync/src/auth/vm/signup_vm.dart';
import 'package:student_sync/widget/custom_button.dart';
import 'package:student_sync/widget/custom_text_field.dart';
import '../../../widget/custom_appbar.dart';
import 'package:student_sync/utils/utility.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref
        .watch(signupViewModelProvider.notifier); // Notifier to trigger actions
    final signupState = ref
        .watch(signupViewModelProvider); // Watching state to rebuild on change
    final WebViewLauncher webViewLauncher = WebViewLauncher();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: 'Signup',
        subtitle: 'Connect with your interests today!',
      ),
      body: SingleChildScrollView(
        //  reverse: false,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: signupState.signupFormKey,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                PrimaryTextField(
                  hintText: "Username",
                  controller: signupState.usernameController,
                  prefixIcon: Icons.person,
                ),
                SizedBox(height: 20.h),
                PrimaryTextField(
                  hintText: "Full Name",
                  controller: signupState.fullNameController,
                  prefixIcon: Icons.person_outline_outlined,
                ),
              SizedBox(height: 20.h,),
              Row(

                children: [
                  // Country Code Selector
                  Expanded(
                    flex: 0, // Adjust flex as per your design requirements
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          favorite: ['+977', 'NP'],
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            vm.setSelectedCountry(country); // Update selected country
                          },
                          moveAlongWithKeyboard: false,
                          countryListTheme: CountryListThemeData(
                            textStyle: context.theme.textTheme.titleSmall!.copyWith(
                              color: const Color(0xFF9095A1),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            bottomSheetHeight: 1.sh / 1.5,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            inputDecoration: InputDecoration(
                              label: const Text('Search Country'),
                              floatingLabelStyle: context.theme.textTheme.titleSmall!.copyWith(
                                color: const Color(0xFF757575),
                                fontSize: 17.sp,
                              ),
                              labelStyle: context.theme.textTheme.titleSmall!.copyWith(
                                color: Colors.grey,
                                fontSize: 12.sp,
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF9E9E9E), width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            searchTextStyle: context.theme.textTheme.titleMedium!.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // Display selected country flag emoji
                                Text(
                                  signupState.selectedCountry != null
                                      ? signupState.selectedCountry!.flagEmoji
                                      : '',
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                SizedBox(width: 5.w),
                                // Display selected country phone code
                                Text(
                                  signupState.selectedCountry != null
                                      ? signupState.selectedCountry!.phoneCode
                                      : 'Select Country',
                                  style: TextStyle(fontSize: 14.sp, color: Colors.black),
                                ),
                              ],
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10.w), // Add spacing between the selector and phone input field

                  // Phone Number Input Field
                  Expanded(
                    flex: 1, // Adjust flex as per your design requirements
                    child: PrimaryTextField(
                      hintText: "Phone Number",
                      controller: signupState.phoneController, // Assume you have a controller for the phone number
                      hasFocusBorder: true,
                    //  label: const Text('Phone Number'),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Only allow digits
                      ],
                    ),
                  ),
                ],
              ),


              SizedBox(height: 20.h),
                PrimaryTextField(
                  hintText: "College Name",
                  controller: signupState.collegeNameController,
                  prefixIcon: Icons.school,
                ),
                SizedBox(height: 20.h),
                PrimaryTextField(
                  hintText: "Email Address",
                  controller: signupState.emailController,
                  prefixIcon: Icons.email,
                  autofillHints: const [AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => vm.validateEmail(value),
                ),
                SizedBox(height: 20.h),
                PrimaryTextField(
                  hintText: "Password",
                  controller: signupState.passwordController,
                  prefixIcon: Icons.lock,
                  autofillHints: const [AutofillHints.password],
                  validator: (value) => vm.validatePassword(value),
                  obscureText: false, // Hide password input
                ),
                SizedBox(height: 20.h),
                PrimaryTextField(
                  hintText: "Confirm Password",
                  controller: signupState.confirmPassController,
                  prefixIcon: Icons.lock,
                  validator: (value) => vm.validatePassword(value),
                  obscureText: true, // Hide password input
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.h),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.black,
                        fillColor: WidgetStateProperty.resolveWith((states) {
                          return Colors
                              .transparent; // No fill color when the checkbox is unchecked
                        }),
                        side: WidgetStateBorderSide.resolveWith((states) {
                          return const BorderSide(
                            color: AppColors
                                .primaryColor, // Border color of the checkbox
                            width: 2, // Border width of the checkbox
                          );
                        }),
                        value: signupState.termsAccepted,
                        onChanged: (value) {
                          vm.toggleTermsAccepted();
                        },
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'I agree with ',
                              style:
                                  context.theme.textTheme.bodySmall!.copyWith(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Terms and Conditions',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      webViewLauncher.launchWebView(context,
                                          "https://nagarikrojgar.com/");
                                    },
                                  style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Todo: Implementation Left
                PrimaryButton(
                    onPressed: () async => {vm.signup()}, label: "Signup"),
                SizedBox(
                  height: 10.h,
                ), //Left to implement,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Already a member? ',
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
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login",
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
      ),
    );
  }
}
