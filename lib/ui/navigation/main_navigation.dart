import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/library/widgets/inherited/provider.dart';
import 'package:movie_app/main_screen/main_screen_model.dart';
import 'package:movie_app/main_screen/main_screen_widget.dart';
import 'package:movie_app/widgets/auth/auth_model.dart';
import 'package:movie_app/widgets/auth/auth_widget.dart';
import 'package:movie_app/widgets/movie_details/movie_details_widget.dart';

abstract class MainNavigationRouteNames {
  static const auth = '/auth';
  static const mainScreen = '/main_screen';
  static const movieDetails = '/main_screen/movie_details';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth 
      ? MainNavigationRouteNames.mainScreen 
      : MainNavigationRouteNames.auth;
  final routes = <String, Widget Function(BuildContext)>{
    '/auth':
        (context) =>
            NotifierProvider(model: AuthModel(), child: const AuthWidget()),
    '/main_screen': (context) => NotifierProvider
    (model: MainScreenModel(), child: const MainScreenWidget())
    // const MainScreenWidget(),
    
  };

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = settings.arguments;
        final movie = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => MovieDetailsWidget(movieId: movie),
          settings: settings,
        );
      default:
        const widget = Scaffold(
          body: Center(
            child: Text('Navigation error'),
          ),
        );
        return MaterialPageRoute(
          builder: (context) => widget,
          settings: settings,
        );
    }
  }
}
