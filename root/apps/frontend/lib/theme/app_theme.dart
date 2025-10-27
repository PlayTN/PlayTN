import 'package:flutter/material.dart';

class AppTheme {
  // --- COLOR PALETTE ---
  static const Color primaryColor = Color(0xFF005A9C); // A deeper, more professional blue
  static const Color accentColor = Color(0xFF00BFA5); // A vibrant teal for accents
  static const Color backgroundColor = Color(0xFFFDFCF8); // An elegant, off-white cream
  static const Color textColor = Color(0xFF333333);
  static const Color subtleTextColor = Color(0xFF666666);
  static const Color borderColor = Color(0xFFE0E0E0);

  // --- THEME DATA ---
  static ThemeData get themeData {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: 'Poppins', 

      // --- Component Themes ---
      appBarTheme: _appBarTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(),
      textButtonTheme: _textButtonTheme(),
      cardTheme: _cardThemeData(),
      floatingActionButtonTheme: _floatingActionButtonTheme(),
      bottomAppBarTheme: _bottomAppBarThemeData(),
    );
  }

  // --- Private Theme Helpers ---

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: textColor),
      titleTextStyle: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontFamily: 'Poppins',
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: primaryColor, width: 2.0),
      ),
      labelStyle: const TextStyle(color: subtleTextColor),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'Poppins'),
      ),
    );
  }

  // Corrected to return and instantiate CardThemeData
  static CardThemeData _cardThemeData() {
    return CardThemeData(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: borderColor, width: 1.5),
       ),
    );
  }

  static FloatingActionButtonThemeData _floatingActionButtonTheme() {
    return const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    );
  }

  // Corrected to return and instantiate BottomAppBarThemeData
  static BottomAppBarThemeData _bottomAppBarThemeData() {
    return const BottomAppBarThemeData(
      color: Colors.white,
      elevation: 2,
      shape: CircularNotchedRectangle(),
      surfaceTintColor: Colors.white,
    );
  }
}
