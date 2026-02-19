import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/data_providers/session_data_provider.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';



class AuthModel extends ChangeNotifier {
  static const _hardcodedUsername = 'admin';
  static const _hardcodedPassword = 'admin123';

  final _sessionDataProvider = SessionDataProvider();

  final loginTextController = TextEditingController(text: _hardcodedUsername);
  final passwordTextController = TextEditingController(text: _hardcodedPassword);

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final navigator = Navigator.of(context);
    final login = loginTextController.text.trim();
    final password = passwordTextController.text.trim();

    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Заполните логин и пароль';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    if (login == _hardcodedUsername && password == _hardcodedPassword) {
      sessionId = 'local_session_admin';
    } else {
      _errorMessage = 'Wrong username or password.';
    }
    _isAuthProgress = false;
    if (_errorMessage != null || sessionId == null) {
      notifyListeners();
      return;
    }

    try {
      await _sessionDataProvider.setSessionId(sessionId);
      unawaited(
        navigator.pushNamed(MainNavigationRouteNames.mainScreen),
      );
    } catch (_) {
      _errorMessage = 'Could not save session on device. Try again.';
      notifyListeners();
    }
  }

  @override
  void dispose() {
    loginTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
}

// class AuthProvider extends InheritedNotifier {
//   final AuthModel model;

//   const AuthProvider({
//     Key? key,
//     required this.model,
//     required Widget child,
//   }) : super(
//           key: key,
//           notifier: model,
//           child: child,
//         );

//   static AuthProvider? watch(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
//   }

//   static AuthProvider? read(BuildContext context) {
//     final widget =
//         context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
//     return widget is AuthProvider ? widget : null;
//   }
// }
