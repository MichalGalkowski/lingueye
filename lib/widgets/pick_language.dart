import 'package:flutter/material.dart';
import 'package:lingueye/styles/my_colors.dart';
import 'package:lingueye/styles/my_styles.dart';

import 'languages_list.dart';

class PickLanguage extends StatelessWidget {
  const PickLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28.0, bottom: 2.0),
            child: Text('Przetłumacz na:', style: MyStyles.smallLightText),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: MyColors.mainMaterial.withOpacity(.2),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                  color: MyColors.mainMaterial.withOpacity(.6), width: 2),
            ),
            height: 72.0,
            child: const LanguagesList(),
          ),
        ],
      ),
    );
  }
}
