import 'package:flutter/material.dart';

// 25

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB', style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Films'),
        BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Serials'),
      ]),
      body: Center(
       child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        }, child: const Text('Press me')),
      )
    );
  }
}