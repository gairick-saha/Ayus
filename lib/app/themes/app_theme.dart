import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const white = Color(0xffffffff);
  static const dodger_blue = Color(0xff418efb);
  static const greyish_brown = Color(0xff3c3c3c);
  static const mid_blue = Color(0xff1f5db5);
  static const ice_blue = Color(0xfff1f7ff);
  static const warm_grey = Color(0xff747474);
  static const white_two = Color(0xffe2e2e2);
  static const pinkish_grey = Color(0xffc8c8c8);
  static const vermillion = Color(0xffea400a);
  static const kelly_green = Color(0xff06be18);
  static const light_blue_grey = Color(0xffe4f2f7);
  static const Color kelly_green_20 = Color(0x5706BE18);

  static const List<Color> blueGradient = [
    Color(0xff4894ff),
    Color(0xff54d1ff),
  ];

  static const List<Color> lightGradient = [
    white,
    light_blue_grey,
  ];

  static InputDecorationTheme get _inputDecorationTheme =>
      ThemeData().inputDecorationTheme.copyWith(
            fillColor: ice_blue,
          );

  static AppBarTheme get _appBarTheme => ThemeData().appBarTheme.copyWith(
        centerTitle: false,
        backgroundColor: dodger_blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        titleTextStyle: GoogleFonts.roboto().copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          letterSpacing: 1,
          color: white,
        ),
      );

  static ThemeData get themeData => ThemeData(
        primaryColor: dodger_blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: dodger_blue,
          secondary: mid_blue,
        ),
        inputDecorationTheme: _inputDecorationTheme,
        disabledColor: pinkish_grey,
        appBarTheme: _appBarTheme,
        dividerColor: Colors.transparent,
      );
}
