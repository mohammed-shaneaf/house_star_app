import 'package:flutter/material.dart';

/// Application color palette
///
/// WHY: Centralizes all colors used in the app for consistency.
/// Makes it easy to rebrand or support themes.
///
/// HOW IT INTEGRATES: Used by AppTheme to configure ThemeData.
/// Also used directly in widgets for custom colors.
///
/// ARCHITECTURE: Part of the design system. Provides semantic color names
/// that describe purpose (primary, error) rather than appearance (blue, red).
///
/// USAGE:
/// ```dart
/// Container(color: AppColors.primary)
/// Text(style: TextStyle(color: AppColors.textPrimary))
/// ```

class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // ==================== Primary Colors ====================

  static const Color primary = Color(0xFF2196F3); // Blue
  static const Color primaryDark = Color(0xFF1976D2);
  static const Color primaryLight = Color(0xFF64B5F6);

  static const Color secondary = Color(0xFFFF9800); // Orange
  static const Color secondaryDark = Color(0xFFF57C00);
  static const Color secondaryLight = Color(0xFFFFB74D);

  // ==================== Semantic Colors ====================

  static const Color success = Color(0xFF4CAF50); // Green
  static const Color warning = Color(0xFFFFC107); // Amber
  static const Color error = Color(0xFFF44336); // Red
  static const Color info = Color(0xFF2196F3); // Blue

  // ==================== Neutral Colors ====================

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // ==================== Light Theme Colors ====================

  static const Color backgroundLight = white;
  static const Color surfaceLight = white;
  static const Color textPrimaryLight = grey900;
  static const Color textSecondaryLight = grey600;
  static const Color dividerLight = grey300;
  static const Color borderLight = grey300;

  // ==================== Dark Theme Colors ====================

  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color textPrimaryDark = white;
  static const Color textSecondaryDark = grey400;
  static const Color dividerDark = grey700;
  static const Color borderDark = grey700;

  // ==================== Functional Colors ====================

  static const Color scaffoldBackgroundLight = grey50;
  static const Color scaffoldBackgroundDark = backgroundDark;

  static const Color cardLight = white;
  static const Color cardDark = surfaceDark;

  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowDark = Color(0x4D000000);

  // ==================== Gradients ====================

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
