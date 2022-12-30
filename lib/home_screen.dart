import 'package:flutter/material.dart';
import 'package:lingueye/pages/lessons_page.dart';

import 'styles/my_colors.dart';
import 'pages/main_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(MyColors.background),
      bottomNavigationBar: NavigationBar(
          height: 64,
          backgroundColor: MyColors.mainMaterial[400],
          animationDuration: const Duration(seconds: 1),
          onDestinationSelected: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
          selectedIndex: _pageIndex,
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.camera), label: 'Zrób zdjęcie'),
            NavigationDestination(icon: Icon(Icons.school), label: 'Lekcje'),
          ]),
      body: <Widget>[
        const MainPage(),
        const LessonsPage(),
      ][_pageIndex],
    );
  }
}
