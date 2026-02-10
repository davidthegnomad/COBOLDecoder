import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background = Color(0xFF121212); // Obsidian
  static const Color accentSuccess = Color(0xFF32CD32); // Cyber-Lime
  static const Color accentError = Color(0xFFBF40BF); // Electric-Purple
  static const Color textPrimary = Color(0xFFF5F5F5); // Off-White
  static const Color textSecondary =
      Color(0xB3F5F5F5); // Off-White with transparency
  static const Color glassBorder = Color(0x33FFFFFF);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      primaryColor: accentSuccess,
      colorScheme: const ColorScheme.dark(
        primary: accentSuccess,
        secondary: accentError,
        surface: background,
        background: background,
        error: accentError,
        onPrimary: background,
        onSecondary: textPrimary,
        onSurface: textPrimary,
        onBackground: textPrimary,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.outfit(
          color: textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.outfit(
          color: textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: GoogleFonts.inter(
          color: textPrimary,
          fontSize: 16,
        ),
        bodyMedium: GoogleFonts.inter(
          color: textSecondary,
          fontSize: 14,
        ),
        labelLarge: GoogleFonts.jetBrainsMono(
          color: textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
