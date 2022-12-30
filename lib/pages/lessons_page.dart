import 'package:flutter/material.dart';

import '../styles/my_colors.dart';
import '../styles/my_styles.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(MyColors.background),
      child: Center(
          child: Text(
        'Main',
        style: MyStyles.textHeader,
      )),
    );
  }
}
