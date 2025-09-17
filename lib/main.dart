import 'package:flutter/material.dart';
import 'package:movie_app/widgets/auth/auth_widget.dart';

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
          backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
          
        ),
        
      ),
      home: AuthWidget(),
    );
  }
}
