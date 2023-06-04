import 'package:flutter/material.dart';

enum AuthState { uninitialized, unauthenticated, authenticated }

class Auth with ChangeNotifier {
  AuthState _authState = AuthState.uninitialized;

  AuthState get authState {
    return _authState;
  }

  // This is a just a placeholder to demonstrate how the authentication flow works.
  // It triggers what would happen when the app's auth state is first loaded.
  Future<void> loadAuthState(bool isLoggedIn) async {
    if (isLoggedIn) {
      _authState = AuthState.authenticated;
    } else {
      _authState = AuthState.unauthenticated;
    }
    notifyListeners();
  }

  Future<void> logIn() async {
    // Add your log in logic here
    _authState = AuthState.authenticated;
    notifyListeners();
  }

  Future<void> signUp() async {
    // Add your sign up logic here
    _authState = AuthState.authenticated;
    notifyListeners();
  }

  Future<void> logOut() async {
    // Add your log out logic here
    _authState = AuthState.unauthenticated;
    notifyListeners();
  }
}
