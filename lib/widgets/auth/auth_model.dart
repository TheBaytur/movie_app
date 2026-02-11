import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/data_providers/session_data_provider.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';



class AuthModel extends ChangeNotifier {
  final _sessionDataProvider = SessionDataProvider();
  final _apiClient = ApiClient();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Заполните логин и пароль';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    try {
      sessionId = await _apiClient.auth(username: login, password: password);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.network:
          _errorMessage = 'Server is unavailable. Check your internet connection.';
          break;
        case ApiClientExceptionType.auth:
          _errorMessage = 'Wrong username or password.';
          break;
        case ApiClientExceptionType.other:
          _errorMessage = 'Something went wrong. Try again.';
          break;
      }
    } catch (_) {
      _errorMessage = 'Something went wrong. Try again.';
    }
    _isAuthProgress = false;
    if (_errorMessage != null || sessionId == null) {
      notifyListeners();
      return;
    }

    await _sessionDataProvider.setSessionId(sessionId);
    unawaited(Navigator.of(context).pushNamed(MainNavigationRouteNames.mainScreen));
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
