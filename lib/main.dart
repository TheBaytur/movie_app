import 'package:flutter/material.dart';
import 'package:movie_app/main_screen/main_screen_widget.dart';
import 'package:movie_app/widgets/auth/auth_widget.dart';
import 'package:movie_app/Theme/app_colors.dart';

void main() {
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
      },
      initialRoute: '/auth',
    );
  }
}

// class ExampleWidget extends StatefulWidget {
//   const ExampleWidget({super.key});

//   @override
//   _MainScreenWidgetState createState() => _MainScreenWidgetState();
// }

// class _MainScreenWidgetState extends State<ExampleWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TMDB', style: TextStyle(color: Colors.white)),
//       ),
//       body: Center(
//        child: ElevatedButton(
//         onPressed: () {
//           Navigator.of(context).pop();
//         }, child: const Text('Press me')),
//       )
//     );
//   }
// }
