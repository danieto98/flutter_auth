import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_auth/providers/auth.dart';
import 'package:flutter_auth/screens/splash_screen.dart';
import 'package:flutter_auth/screens/onboarding_screen.dart';
import 'package:flutter_auth/screens/login_screen.dart';
import 'package:flutter_auth/screens/signup_screen.dart';
import 'package:flutter_auth/screens/home_screen.dart';

class AppRouter {
  final Auth _auth;

  AppRouter(this._auth);

  static const List<String> _outsideAppRouteNames = [
    OnboardingScreen.routeName,
    LoginScreen.routeName,
    SignupScreen.routeName
  ];

  static final List<GoRoute> _routes = [
    GoRoute(
      name: SplashScreen.routeName,
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: OnboardingScreen.routeName,
      path: '/${OnboardingScreen.routeName}',
      builder: (context, state) => const OnboardingScreen(),
      routes: [
        GoRoute(
          name: LoginScreen.routeName,
          path: LoginScreen.routeName,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: SignupScreen.routeName,
          path: SignupScreen.routeName,
          builder: (context, state) => const SignupScreen(),
        ),
      ],
    ),
    GoRoute(
      name: HomeScreen.routeName,
      path: '/${HomeScreen.routeName}',
      builder: (context, state) => const HomeScreen(),
    ),
  ];

  String? redirect(BuildContext context, GoRouterState state) {
    String splashLocation = state.namedLocation(SplashScreen.routeName);

    bool navigatingToSplash = state.location == splashLocation;
    bool navigatingOutsideApp = _outsideAppRouteNames
        .map((outsideAppRouteName) => state.namedLocation(outsideAppRouteName))
        .contains(state.location);

    if (_auth.authState == AuthState.uninitialized && !navigatingToSplash) {
      return splashLocation;
    } else if (_auth.authState == AuthState.unauthenticated &&
        !navigatingOutsideApp) {
      return state.namedLocation(OnboardingScreen.routeName);
    } else if (_auth.authState == AuthState.authenticated &&
        (navigatingToSplash || navigatingOutsideApp)) {
      return state.namedLocation(HomeScreen.routeName);
    } else {
      return null;
    }
  }

  late final GoRouter _router = GoRouter(
    refreshListenable: _auth,
    routes: _routes,
    redirect: redirect,
  );

  GoRouter get router {
    return _router;
  }
}
