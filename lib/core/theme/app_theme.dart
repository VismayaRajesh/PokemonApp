import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.nunito(fontSize: 18, color: Colors.black),
      bodyMedium: GoogleFonts.nunito(fontSize: 16, color: Colors.grey[600]),
      bodySmall: GoogleFonts.nunito(fontSize: 14, color: Colors.black),
      titleLarge: GoogleFonts.nunito(fontSize: 18, color: Colors.black),
      titleMedium: GoogleFonts.nunito(fontSize: 16, color: Colors.black),
      titleSmall: GoogleFonts.nunito(fontSize: 14, color: Colors.black),
      labelLarge: GoogleFonts.nunito(fontSize: 18, color: Colors.black),
      labelMedium: GoogleFonts.nunito(fontSize: 16, color: Colors.black),
      labelSmall: GoogleFonts.nunito(fontSize: 14, color: Colors.black),
      displayLarge: GoogleFonts.nunito(fontSize: 18, color: Colors.black),
      displayMedium: GoogleFonts.nunito(fontSize: 16, color: Colors.black),
      displaySmall: GoogleFonts.nunito(fontSize: 14, color: Colors.black),
      headlineLarge: GoogleFonts.nunito(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
      headlineMedium: GoogleFonts.nunito(fontSize: 16, color: Colors.black),
      headlineSmall: GoogleFonts.nunito(fontSize: 14, color: Colors.black),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
    ),
    hintColor: Colors.black38,
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all<Color>(Colors.black),
      fillColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all<Color>(Colors.black),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: AppColors.darkModeColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkModeColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.nunito(fontSize: 18, color: Colors.white),
      bodyMedium: GoogleFonts.nunito(fontSize: 16, color: Colors.white),
      bodySmall: GoogleFonts.nunito(fontSize: 14, color: Colors.white),
      titleLarge: GoogleFonts.nunito(fontSize: 18, color: Colors.white),
      titleMedium: GoogleFonts.nunito(fontSize: 16, color: Colors.white),
      titleSmall: GoogleFonts.nunito(fontSize: 14, color: Colors.white),
      labelLarge: GoogleFonts.nunito(fontSize: 18, color: Colors.white),
      labelMedium: GoogleFonts.nunito(fontSize: 16, color: Colors.white),
      labelSmall: GoogleFonts.nunito(fontSize: 14, color: Colors.white),
      displayLarge: GoogleFonts.nunito(fontSize: 18, color: Colors.white),
      displayMedium: GoogleFonts.nunito(fontSize: 16, color: Colors.white),
      displaySmall: GoogleFonts.nunito(fontSize: 14, color: Colors.white),
      headlineLarge: GoogleFonts.nunito(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
      headlineMedium: GoogleFonts.nunito(fontSize: 16, color: Colors.white),
      headlineSmall: GoogleFonts.nunito(fontSize: 14, color: Colors.white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    ),
    hintColor: Colors.grey[600],
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all<Color>(Colors.white),
      fillColor: WidgetStateProperty.all<Color>(Colors.black),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all<Color>(Colors.white),
      ),
    ),
  );
}
