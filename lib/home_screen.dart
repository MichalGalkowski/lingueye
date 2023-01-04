import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lingueye/widgets/pick_language.dart';
import 'package:lingueye/working_page.dart';
import 'package:provider/provider.dart';

import 'providers/data_provider.dart';
import 'styles/my_colors.dart';
import 'main_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile _img = XFile('');
  bool _isImage = false;

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    _img = dataProvider.getImage;
    _isImage = _img.path.isNotEmpty;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(MyColors.background),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _isImage ? const WorkingPage() : const MainPage()),
            const PickLanguage(),
          ],
        ),
      ),
    );
  }
}
