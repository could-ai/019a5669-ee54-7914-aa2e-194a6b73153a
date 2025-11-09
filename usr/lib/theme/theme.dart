import 'package:couldai_user_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData bumBrowserTheme() {
  final baseTheme = ThemeData.light();

  final textTheme = TextTheme(
    displayLarge: GoogleFonts.libreBaskerville(
        fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5, color: AppColors.inkBlack),
    displayMedium: GoogleFonts.libreBaskerville(
        fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5, color: AppColors.inkBlack),
    displaySmall: GoogleFonts.libreBaskerville(fontSize: 48, fontWeight: FontWeight.w400, color: AppColors.inkBlack),
    headlineMedium: GoogleFonts.libreBaskerville(
        fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: AppColors.inkBlack),
    headlineSmall: GoogleFonts.libreBaskerville(fontSize: 24, fontWeight: FontWeight.w400, color: AppColors.inkBlack),
    titleLarge: GoogleFonts.libreBaskerville(
        fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15, color: AppColors.inkBlack),
    titleMedium: GoogleFonts.libreBaskerville(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15, color: AppColors.inkBlack),
    titleSmall: GoogleFonts.libreBaskerville(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1, color: AppColors.inkBlack),
    bodyLarge: GoogleFonts.libreBaskerville(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5, color: AppColors.inkBlack),
    bodyMedium: GoogleFonts.libreBaskerville(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: AppColors.inkBlack),
    labelLarge: GoogleFonts.libreBaskerville(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25, color: AppColors.inkBlack),
    bodySmall: GoogleFonts.libreBaskerville(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: AppColors.inkBlack),
    labelSmall: GoogleFonts.libreBaskerville(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5, color: AppColors.inkBlack),
  );

  return baseTheme.copyWith(
    primaryColor: AppColors.inkBlack,
    scaffoldBackgroundColor: AppColors.parchment,
    colorScheme: const ColorScheme.light(
      primary: AppColors.inkBlack,
      secondary: AppColors.accent,
      surface: AppColors.parchment,
      background: AppColors.parchment,
      error: Colors.red,
      onPrimary: AppColors.parchment,
      onSecondary: AppColors.parchment,
      onSurface: AppColors.inkBlack,
      onBackground: AppColors.inkBlack,
      onError: Colors.white,
    ),
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.parchment,
      foregroundColor: AppColors.inkBlack,
      elevation: 0,
      titleTextStyle: textTheme.titleLarge,
      shape: Border(
        bottom: BorderSide(color: AppColors.inkBlack.withOpacity(0.5), width: 1),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
        side: BorderSide(color: AppColors.inkBlack, width: 1),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: const BorderSide(color: AppColors.inkBlack),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: const BorderSide(color: AppColors.accent, width: 2),
      ),
      labelStyle: textTheme.bodyMedium,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.parchment,
        backgroundColor: AppColors.inkBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side: const BorderSide(color: AppColors.inkBlack),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: textTheme.labelLarge,
      ),
    ),
  );
}
