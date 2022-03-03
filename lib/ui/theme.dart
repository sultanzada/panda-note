import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color blueishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkColor = Color(0xFFff4667);
const Color white = Colors.white;
const Color primaryClr = blueishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    colorScheme: ColorScheme.light().copyWith(
      primary: primaryClr,
      brightness: Brightness.light,
      background: white,
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.grey.withOpacity(.5),
      cursorColor: Colors.grey[700],
      selectionHandleColor: Colors.grey.withOpacity(1),
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
    ),
  );
  static final dark = ThemeData(
    colorScheme: ColorScheme.dark().copyWith(
      primary: primaryClr,
      brightness: Brightness.dark,
      background: darkGreyClr,
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.grey[100].withOpacity(.5),
      cursorColor: Colors.grey[100],
      selectionHandleColor: Colors.grey[100].withOpacity(1),
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
    ),
  );
}

// TextStyle subHeadingStyle = GoogleFonts.lato();
TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
    ),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? white : Colors.black,
    ),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? white : Colors.black,
    ),
  );
}

TextStyle get hintTextStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
  );
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600],
    ),
  );
}

OutlineInputBorder get formBorder {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 1.0,
    ),
  );
}
