import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_colors.dart';

class MyStyles {
  static TextStyle textButtonLight = GoogleFonts.kodchasan(
      color: MyColors.mainMaterial[100],
      fontWeight: FontWeight.w100,
      fontSize: 14.0);
  static TextStyle textButtonDark = GoogleFonts.kodchasan(
      color: MyColors.mainMaterial[900],
      fontWeight: FontWeight.w100,
      fontSize: 14.0);
  static TextStyle smallLightText = GoogleFonts.kodchasan(
      fontWeight: FontWeight.w100,
      fontSize: 12,
      color: MyColors.mainMaterial[200]);
  static TextStyle headerText = GoogleFonts.kodchasan(
      color: MyColors.mainMaterial,
      fontWeight: FontWeight.w300,
      fontSize: 32.0);
  static TextStyle logoText = GoogleFonts.kodchasan(
      color: MyColors.mainMaterial,
      fontWeight: FontWeight.w300,
      fontSize: 48.0);
  static TextStyle text = GoogleFonts.openSans(
    color: MyColors.mainMaterial[100],
    fontWeight: FontWeight.w300,
    fontSize: 16,
  );
}
