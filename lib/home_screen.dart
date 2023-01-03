import 'package:flutter/material.dart';

import 'styles/my_colors.dart';
import 'main_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(MyColors.background),
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(child: MainPage()),
          ],
        ),
      ),
    );
  }
}
