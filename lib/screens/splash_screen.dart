import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_auth/providers/auth.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = 'splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            // This is just a placeholder that shows what would happen
            // when your app finishes loading its authentication state.
            // In this case, the user was logged out when the app last loaded.
            onPressed: () =>
                Provider.of<Auth>(context, listen: false).loadAuthState(false),
            child: const Text('Initialize logged out'),
          ),
          TextButton(
            // This is just a placeholder that shows what would happen
            // when your app finishes loading its authentication state.
            // In this case, the user was logged in when the app last loaded.
            onPressed: () =>
                Provider.of<Auth>(context, listen: false).loadAuthState(true),
            child: const Text('Initialize logged in'),
          ),
        ],
      ),
    );
  }
}
