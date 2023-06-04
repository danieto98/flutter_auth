import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_auth/app_router.dart';
import 'package:flutter_auth/providers/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Auth _auth = Auth();
  late final AppRouter _appRouter = AppRouter(_auth);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => _auth,
        ),
      ],
      builder: (ctx, _) => MaterialApp.router(
        title: 'Flutter Auth',
        routerConfig: _appRouter.router,
      ),
    );
  }
}
