import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_colors.dart';

class MyStyles {
  static TextStyle textHeader = GoogleFonts.kodchasan(
      color: MyColors.mainMaterial[100],
      fontWeight: FontWeight.w100,
      fontSize: 14.0);
  static TextStyle textButtonDark = GoogleFonts.kodchasan(
      color: MyColors.mainMaterial[900],
      fontWeight: FontWeight.w200,
      fontSize: 14.0);
}
