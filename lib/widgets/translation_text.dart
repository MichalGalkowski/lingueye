import 'package:flutter/material.dart';
import 'package:lingueye/styles/my_styles.dart';
import 'package:provider/provider.dart';

import '../providers/data_provider.dart';
import '../styles/my_colors.dart';

class TranslationText extends StatelessWidget {
  const TranslationText({super.key});

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    String translatedText = dataProvider.getTranslatedText;
    return Card(
      color: MyColors.mainMaterial[800],
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SelectableText(
              translatedText,
              style: MyStyles.text,
            ),
          ),
        ),
      ),
    );
  }
}
