
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
