import 'package:flutter/material.dart';
import 'package:movie_app/main_screen/main_screen_widget.dart';
import 'package:movie_app/widgets/auth/auth_widget.dart';
import 'package:movie_app/Theme/app_colors.dart';
import 'package:movie_app/widgets/movie_details/movie_details_widget.dart';

// 3 nov 2023 - start app

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainDarkBlue,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        '/auth': (context) => const AuthWidget(),
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
      },
      initialRoute: '/auth',
    );
  }
}
