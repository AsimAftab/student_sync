import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_sync/src/auth/view/login_view.dart';
import 'package:student_sync/src/auth/view/note_view.dart';
import 'package:student_sync/src/auth/view/signup_view.dart';

// Define your routes in a Router configuration
final GoRouter router = GoRouter(
  initialLocation: '/signup',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const NoteListScreen(),
    ),
    GoRoute(path: '/login',builder: (context,state) => const LoginView()),
    GoRoute(path: '/signup',builder: (context,state) => const SignUpView()),
    // Define more routes here as needed
  ],
  errorBuilder: (context, state) {
    return const OopsPage();
  },
);

class OopsPage extends StatelessWidget {
  const OopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oops!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Something went wrong!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the home screen
                context.go('/');
              },
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
