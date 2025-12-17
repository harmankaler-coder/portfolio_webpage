import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors
  static const primaryColor = Color(0xFF64FFDA); // Neon Cyan
  static const backgroundColor = Color(0xFF0A192F); // Deep Navy
  static const surfaceColor = Color(0xFF112240); // Lighter Navy
  static const textPrimary = Color(0xFFCCD6F6);
  static const textSecondary = Color(0xFF8892B0);

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      surface: surfaceColor,
      onSurface: textPrimary,
      surfaceContainer: surfaceColor,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: textPrimary,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 18,
        height: 1.6,
        color: textSecondary,
      ),
      labelLarge: GoogleFonts.jetBrainsMono(
        color: primaryColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: const IconThemeData(color: textSecondary),
  );
}