import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lingueye/styles/my_styles.dart';

import '../styles/my_colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(MyColors.background),
      child: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 48.0,
          ),
          Expanded(
            flex: 3,
            child: SvgPicture.asset(
              'assets/logo.svg',
              color: MyColors.mainMaterial,
              width: MediaQuery.of(context).size.width * .6,
            ),
          ),
          OutlinedButton(
              onPressed: () {},
              child: Text(
                'Zrób zdjęcie tekstu do przetłumaczenia',
                textAlign: TextAlign.center,
                style: MyStyles.textHeader,
              )),
          const Expanded(flex: 1, child: SizedBox()),
        ],
      )),
    );
  }
}
