import 'package:flutter/material.dart';
import '../../../widget/custom_appbar.dart'; // Adjust the import path

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Signup',
        subtitle: 'Connect with your interests today!',
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Your content goes here
            Text('Sign-up form goes here'),
          ],
        ),
      ),
    );
  }
}
