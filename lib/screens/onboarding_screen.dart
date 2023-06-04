import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_auth/screens/login_screen.dart';
import 'package:flutter_auth/screens/signup_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = 'onboarding';

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              context.pushNamed(LoginScreen.routeName);
            },
            child: const Text('Go To Log In'),
          ),
          TextButton(
            onPressed: () {
              context.pushNamed(SignupScreen.routeName);
            },
            child: const Text('Go To Sign Up'),
          ),
        ],
      ),
    );
  }
}
