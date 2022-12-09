import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyColors {
//  backgroundColor background: #1E1E1E;
// btn greenish color #22B07D;
// font used Lato
// backgroundColor for cards and list tiles background: #252836;
// backgroundColor for back icon background: #FF8700;

  static const background_color = Color(0XFF1E1E1E);
  static const backgroud_card_color = Color(0xff252836);
  static const backgroud_list_color = Color(0xff252836);
  static const backgroud_icon_back_color = Color(0xffFF8700);
  static const btn_greenish_color = Color(0xff22B07D);
  static const btn_purpleish_color = Color(0xff525298);
}

class MyWidgets {
  static Widget buildBox(
      {Color? color, double? width, double? height, Widget? widget}) {
    return Container(height: height, width: width, color: color, child: widget);
  }

  static Container myUnitsWidget() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), border: Border.all()),
      child: Center(
        child: Text(
          "MY UNITS",
          style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 22),
        ),
      ),
    );
  }
}
