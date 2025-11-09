import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _backgroundColor = Color(0xFFFDF5E6); // Old Lace
  static const Color _primaryTextColor = Color(0xFF1A1A1A);
  static const Color _borderColor = Color(0xFFBDBDBD);

  static ThemeData get bumBrowserTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: _backgroundColor,
      primaryColor: _primaryTextColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryTextColor,
        background: _backgroundColor,
        primary: _primaryTextColor,
      ),
      appBarTheme: _appBarTheme(),
      textTheme: _textTheme(),
      cardTheme: _cardTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(),
      dialogTheme: _dialogTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
    );
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      backgroundColor: _backgroundColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: _primaryTextColor),
      titleTextStyle: GoogleFonts.playfairDisplay(
        color: _primaryTextColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  static TextTheme _textTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.playfairDisplay(color: _primaryTextColor, fontWeight: FontWeight.bold),
      displayMedium: GoogleFonts.playfairDisplay(color: _primaryTextColor, fontWeight: FontWeight.bold),
      displaySmall: GoogleFonts.playfairDisplay(color: _primaryTextColor, fontWeight: FontWeight.bold),
      headlineMedium: GoogleFonts.playfairDisplay(color: _primaryTextColor, fontWeight: FontWeight.bold),
      headlineSmall: GoogleFonts.playfairDisplay(color: _primaryTextColor, fontWeight: FontWeight.bold),
      titleLarge: GoogleFonts.playfairDisplay(color: _primaryTextColor, fontWeight: FontWeight.bold),
      bodyLarge: GoogleFonts.ebGaramond(color: _primaryTextColor, fontSize: 16),
      bodyMedium: GoogleFonts.ebGaramond(color: _primaryTextColor, fontSize: 14),
      labelLarge: GoogleFonts.ebGaramond(color: _backgroundColor, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  static CardTheme _cardTheme() {
    return CardTheme(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
        side: const BorderSide(color: _borderColor, width: 1),
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryTextColor,
        foregroundColor: _backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: GoogleFonts.ebGaramond(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
  
  static DialogTheme _dialogTheme() {
    return DialogTheme(
      backgroundColor: _backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: const BorderSide(color: _primaryTextColor, width: 2),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: const BorderSide(color: _borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: const BorderSide(color: _primaryTextColor, width: 2),
      ),
      labelStyle: GoogleFonts.ebGaramond(color: _primaryTextColor),
    );
  }
}
