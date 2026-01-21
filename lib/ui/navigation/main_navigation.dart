import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/main_screen/main_screen_widget.dart';
import 'package:movie_app/widgets/auth/auth_model.dart';
import 'package:movie_app/widgets/auth/auth_widget.dart';
import 'package:movie_app/widgets/movie_details/movie_details_widget.dart';

abstract class MainNavigationRoutes {
  static const auth = '/auth';
  static const mainScreen = '/main_screen';
  static const movieDetails = '/main_screen/movie_details';
}

class MainNavigation {
  String initialRoute(bool isAuth) =>
      isAuth ? MainNavigationRoutes.mainScreen : MainNavigationRoutes.auth;
  final routes = <String, Widget Function(BuildContext)>{
    '/auth':
        (context) =>
            AuthProvider(model: AuthModel(), child: const AuthWidget()),
    '/main_screen': (context) => const MainScreenWidget(),
    '/main_screen/movie_details': (context) {
      final arguments = ModalRoute.of(context)?.settings.arguments;
      if (arguments is! int) {
        // Show a lightweight error screen instead of throwing so the app does not freeze.
        return const Scaffold(
          body: Center(
            child: Text(
              'Movie id is required',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
      final id = arguments;
      return MovieDetailsWidget(movieId: id);
    },
  };

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(
        builder: (context) => builder(context),
        settings: settings,
      );
    }
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(
            'Route not found',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      settings: settings,
    );
  }
}
