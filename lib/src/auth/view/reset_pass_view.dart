import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_sync/extension/theme_extension.dart';
import 'package:student_sync/src/auth/vm/reset_pass_vm.dart';
import 'package:student_sync/widget/custom_appbar.dart';
import 'package:student_sync/widget/custom_button.dart';
import 'package:student_sync/widget/custom_text_field.dart';

class ResetPassView extends ConsumerWidget {
  const ResetPassView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(resetPassViewModelProvider.notifier);
    final resetPassState = ref.watch(resetPassViewModelProvider);
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar:  const CustomAppBar(title: "Reset Password", subtitle: ""),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 30),
               child: Align(
                 alignment: Alignment.center,
                 child: Text(
                      "Create a new password. Ensure it is different from previous for security.",
                 style: context.theme.textTheme.titleMedium!.copyWith(
                   fontFamily: 'Poppins',
                   fontSize: 14.sp,
                   color: Colors.black,
                   fontWeight: FontWeight.w600,

                 ),),
               ),
             ),
            SizedBox(height: 40.h,),
            PrimaryTextField(
              hintText: "Password",
              controller: resetPassState.password,
              prefixIcon: Icons.lock,
            ),
            SizedBox(height: 20.h,),
            PrimaryTextField(
              hintText: "Confirm Password",
              controller: resetPassState.confirmPass,
              prefixIcon: Icons.lock,
            ),
            SizedBox(height: 20.h,),
            PrimaryButton(onPressed: () => {}, label: "Update Password"),
          ],
        ),
      )),
    );
  }
}
