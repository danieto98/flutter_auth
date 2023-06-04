import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_auth/providers/auth.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Provider.of<Auth>(context, listen: false).logOut();
          },
          child: const Text('Log Out'),
        ),
      ),
    );
  }
}
