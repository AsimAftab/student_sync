import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_sync/src/auth/vm/login_vm.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(loginViewModelProvider.notifier);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 280.h, // Set a specific height for the Stack
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
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
                    child: Container(
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
                    child: Container(
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
            SizedBox(height: 80.h), // Add some space between Stack and the text
            Text(
              "Hi, Welcome Back!👋",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700
              ),
            ),
          SizedBox(height: 20.h,),
            SizedBox(
              height: 50.h,
              width: 321.w, // You can uncomment and adjust this line if you want width to be responsive
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                  hintText: "Email Address",
                  hintStyle: TextStyle(
                    color: Color(0xFFA5A5A5),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    borderSide: BorderSide(color: Colors.black, width: 1.w),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    borderSide: BorderSide(color: Color(0xFFA5A5A5)),
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
