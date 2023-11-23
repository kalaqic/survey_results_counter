import 'package:flutter/material.dart';

class CustomTheme {
  static String primaryFont = 'LemonMilk';
  static Color white = Colors.white;
  static Color grayBlue = const Color(0xFFB0D7E2);
  static Color greenBLue = const Color(0xFF549AAB);
  static Color darkerBlue = const Color(0xFF123740);
  static Color orange = const Color(0xFFF1802D);

  static TextStyle titleTextStyle({double fontSize = 20}) {
    return TextStyle(
      fontFamily: primaryFont,
      fontSize: fontSize,
      color: white,
    );
  }
}
