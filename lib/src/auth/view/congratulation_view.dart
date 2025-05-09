import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_sync/extension/theme_extension.dart';
import 'package:student_sync/src/auth/vm/congratulation_vm.dart';
import 'package:student_sync/widget/custom_appbar.dart';
import 'package:student_sync/widget/custom_button.dart';

class CongratulationView extends ConsumerWidget {
  const CongratulationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    final vm = ref.watch(congratulationViewModelProvider.notifier);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Congratulation!" ,subtitle: "",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hi, Welcome On Board! 👋 ",
            style: context.theme.textTheme.titleMedium!.copyWith(
              fontFamily: 'Poppins',
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black
            ),),
            SizedBox(height: 20.h),
            SvgPicture.asset('assets/icons/success.svg'),
            SizedBox(height: 20.h),
            PrimaryButton(onPressed: ()=>{}, label: 'Continue'),
            // BottomNavigationBar(items: NavigationDestination(icon: Icons.abc, label: "abc")),
          ],
        ),
      ),
    );
  }
}
