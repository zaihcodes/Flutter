import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = Color(0xFF54D3C2);
  static Color secondaryColor = Color(0xFF54D3C2);
}

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    primaryColor: AppColors.primaryColor,
    indicatorColor: Colors.white,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    canvasColor: Colors.white,
    // backgroundColor: const Color(0xFFFFFFFF),
    scaffoldBackgroundColor: const Color(0xFFF6F6F6),
    // errorColor: const Color(0xFFB00020),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontFamily: 'workSans'),
      displayMedium: TextStyle(fontFamily: 'workSans'),
      displaySmall: TextStyle(fontFamily: 'workSans'),
      titleLarge: TextStyle(fontFamily: 'workSans'),
      titleMedium: TextStyle(fontFamily: 'workSans'),
      titleSmall: TextStyle(fontFamily: 'workSans'),
      bodyLarge: TextStyle(fontFamily: 'workSans'),
      bodyMedium: TextStyle(fontFamily: 'workSans'),
      bodySmall: TextStyle(fontFamily: 'workSans'),
      labelLarge: TextStyle(fontFamily: 'workSans'),
    ),
    platform: TargetPlatform.iOS,
  );
}
