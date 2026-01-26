import 'package:flutter/material.dart';
import 'package:stock_investments/constant/app_colors.dart';

class AppTheme {
  //Light Theme
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBarColorLight,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.black12,
      surface: AppColors.primaryColor,
    ),
    cardTheme: CardTheme(
      color: AppColors.primaryColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        foregroundColor: AppColors.primaryColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),
  );

  // DARK THEME
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black12,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBarColorDark,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      titleTextStyle: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.green,
      secondary: Colors.greenAccent,
      surface: const Color(0xFF1E293B),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF1E293B),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        foregroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),
  );
}
