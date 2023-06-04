import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutter_auth/providers/auth.dart';
import 'package:flutter_auth/screens/login_screen.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = 'signup';

  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Provider.of<Auth>(context, listen: false).signUp();
            },
            child: const Text('Sign Up'),
          ),
          TextButton(
            onPressed: () {
              context.pushReplacementNamed(LoginScreen.routeName);
            },
            child: const Text('Go To Log In'),
          ),
        ],
      ),
    );
  }
}
