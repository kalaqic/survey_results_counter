import 'package:flutter/material.dart';

class CustomTheme {
  static String primaryFont = 'LemonMilk';
  static String secondaryFont = 'Aharoni';
  static Color white = Colors.white;
  static Color red = Colors.redAccent;
  static Color green = const Color.fromARGB(255, 15, 237, 67);
  static Color grayBlue = const Color(0xFFB0D7E2);
  static Color greenBLue = const Color(0xFF549AAB);
  static Color darkerBlue = const Color(0xFF123740);
  static Color orange = const Color(0xFFF1802D);

  static TextStyle titleTextStyle(
      {double fontSize = 20, Color color = Colors.white}) {
    return TextStyle(
      fontFamily: secondaryFont,
      fontSize: fontSize,
      color: color,
    );
  }
}
