import 'package:flutter/material.dart';

import '../widgets/movie_list/movie_list_widget.dart';
import '../widgets/news/news_list_widget.dart';

// 14.10

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  

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
      body:  IndexedStack(
        index: _selectedTab,
        children: const [
        NewsListWidget(),
        MovieListWidget(),
        Text('Serials'),
        ],
      ),
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
