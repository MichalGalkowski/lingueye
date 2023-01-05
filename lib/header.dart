import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lingueye/styles/my_colors.dart';
import 'package:provider/provider.dart';

import 'providers/data_provider.dart';
import 'styles/my_styles.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    void clearData() {
      dataProvider
        ..changeEditText('')
        ..changeImage(XFile(''))
        ..changeTranslatedText('', '');
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: SvgPicture.asset(
              'assets/logo.svg',
              color: MyColors.mainMaterial,
              width: 80,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'LinguEye',
              style: MyStyles.headerText,
            ),
          ),
          ElevatedButton(
              onPressed: () => clearData(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.mainMaterial[400]),
              child: Text(
                'Wyczyść',
                style: MyStyles.textButtonDark,
              )),
        ],
      ),
    );
  }
}
