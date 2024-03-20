import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';


class CustomTextStyles {
  static head(String content, double? size) {
    return Text(
      content,
      style: GoogleFonts.manrope(
          color: Colors.black, fontSize: size, fontWeight: FontWeight.bold),
    );
  }

  static subtext(content, size, align) {
    return Text(
      content,
      style:
          GoogleFonts.manrope(color: Colors.black, fontSize: size),
      textAlign: align,
    );
  }
}
