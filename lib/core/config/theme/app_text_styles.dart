import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Display Styles
  static TextStyle displayLarge = GoogleFonts.poppins(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle displayMedium = GoogleFonts.poppins(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle displaySmall = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  // Headline Styles
  static TextStyle headlineLarge = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle headlineMedium = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static TextStyle headlineSmall = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // Body Styles
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Label Styles
  static TextStyle labelLarge = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static TextStyle labelMedium = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static TextStyle labelSmall = GoogleFonts.inter(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textLight,
    height: 1.4,
  );

  // Button Styles
  static TextStyle button = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
    height: 1.2,
  );
}
