import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutter_auth/providers/auth.dart';
import 'package:flutter_auth/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Provider.of<Auth>(context, listen: false).logIn();
            },
            child: const Text('Log In'),
          ),
          TextButton(
            onPressed: () {
              context.pushReplacementNamed(SignupScreen.routeName);
            },
            child: const Text('Go To Sign Up'),
          ),
        ],
      ),
    );
  }
}
