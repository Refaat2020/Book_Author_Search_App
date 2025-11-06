import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryDark = Color(0xFF4B45DB);
  static const Color primaryLight = Color(0xFF9B95FF);

  // Secondary Colors
  static const Color secondary = Color(0xFFFF6584);
  static const Color secondaryDark = Color(0xFFE64567);
  static const Color secondaryLight = Color(0xFFFF94AA);

  // Gradient Colors
  static const Color gradientStart = Color(0xFF667eea);
  static const Color gradientEnd = Color(0xFF764ba2);

  static const Color cardGradientStart = Color(0xFFffdde1);
  static const Color cardGradientEnd = Color(0xFFee9ca7);

  // Background Colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color backgroundDark = Color(0xFF1A1A2E);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF16213E);

  // Text Colors
  static const Color textPrimary = Color(0xFF2D3748);
  static const Color textSecondary = Color(0xFF718096);
  static const Color textLight = Color(0xFFA0AEC0);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Status Colors
  static const Color success = Color(0xFF48BB78);
  static const Color error = Color(0xFFF56565);
  static const Color warning = Color(0xFFED8936);
  static const Color info = Color(0xFF4299E1);

  // Border Colors
  static const Color border = Color(0xFFE2E8F0);
  static const Color borderLight = Color(0xFFF7FAFC);

  // Shadow Colors
  static const Color shadow = Color(0x1A000000);
  static const Color shadowDark = Color(0x33000000);

  // Gradient Definitions
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientStart, gradientEnd],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [cardGradientStart, cardGradientEnd],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );
}
