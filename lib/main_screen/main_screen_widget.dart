import 'package:flutter/material.dart';

// 25

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;

  void onSelectedTab(int index) {
    if (_selectedTab == index) {
      return;
    }
    setState(() {
      _selectedTab = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB', style: TextStyle(color: Colors.white)),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedTab,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Films'),
        BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Serials'),
      ],
      onTap: onSelectedTab,
      ),
      
      
      );
  }
}