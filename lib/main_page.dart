import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lingueye/helpers/imagehelper.dart';
import 'package:provider/provider.dart';

import 'providers/data_provider.dart';
import 'styles/my_styles.dart';

import 'styles/my_colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    return SafeArea(
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () => ImageHelper().pickImage(dataProvider),
                    child: SvgPicture.asset(
                      'assets/logo.svg',
                      color: MyColors.mainMaterial,
                      width: MediaQuery.of(context).size.width * .6,
                    ),
                  ),
                ),
                Text(
                  'LinguEye',
                  style: MyStyles.logoText,
                ),
                const SizedBox(
                  height: 60.0,
                ),
                ElevatedButton(
                    onPressed: () => ImageHelper().pickImage(dataProvider),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.mainMaterial[800]),
                    child: Text(
                      'Zrób zdjęcie tekstu do przetłumaczenia',
                      textAlign: TextAlign.center,
                      style: MyStyles.textButtonLight,
                    )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
