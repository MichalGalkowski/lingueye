import 'package:flutter/material.dart';
import 'package:lingueye/styles/my_styles.dart';
import 'package:provider/provider.dart';

import '/header.dart';
import '/widgets/show_image.dart';
import 'providers/data_provider.dart';
import 'widgets/edit_text.dart';
import 'widgets/translation_text.dart';

class WorkingPage extends StatelessWidget {
  const WorkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    String languageName = dataProvider.getLanguageName;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const SizedBox(
              height: 12,
            ),
            const ShowImage(),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 0, 0),
              child: Text(
                'Tekst $languageName',
                style: MyStyles.smallLightText,
              ),
            ),
            const Flexible(
              child: EditText(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 0, 0),
              child: Text(
                'Tłumaczenie',
                style: MyStyles.smallLightText,
              ),
            ),
            const Flexible(
              child: TranslationText(),
            ),
          ],
        ),
      ),
    );
  }
}
