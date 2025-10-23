import 'package:flutter/material.dart';

class AppColors {
  static const primary =
      Color(0xFF1E88E5); // ← replace with Figma primary color
  static const accent = Color(0xFFFF5252); // ← replace with Figma accent color
  static const background =
      Color(0xFFF7F7FB); // ← replace with Figma background
  static const card = Colors.white;
  static const muted = Color(0xFF9E9E9E);
}

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      // fontFamily: 'FigmaPrimary', // ← uncomment and set after exporting fonts from Figma
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.card,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      textTheme: const TextTheme(
          // headline6: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          // bodyText2: TextStyle(fontSize: 14),
          ),
    );
  }
}
