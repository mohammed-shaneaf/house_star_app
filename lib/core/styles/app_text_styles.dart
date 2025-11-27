/// Typography system
///
/// WHY: Provides consistent text styles throughout the app.
/// Ensures proper hierarchy and readability.
///
/// HOW IT INTEGRATES: Used by AppTheme for TextTheme configuration.
/// Also used directly in widgets for custom text styling.
///
/// ARCHITECTURE: Part of the design system. Defines semantic text styles
/// (heading, body, caption) that adapt to theme mode.
///
/// USAGE:
/// ```dart
/// Text('Title', style: AppTextStyles.heading1)
/// Text('Body', style: AppTextStyles.body1)
/// ```

import 'dart:ui';

import 'app_colors.dart';

class AppTextStyles {
  // Private constructor to prevent instantiation
  AppTextStyles._();

  // Font family
  static const String fontFamily = 'Roboto';

  // ==================== Headings ====================

  static final TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.2,
    letterSpacing: -0.5,
    fontFamily: fontFamily,
  );

  static final TextStyle heading2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 1.3,
    letterSpacing: -0.5,
    fontFamily: fontFamily,
  );

  static final TextStyle heading3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.3,
    letterSpacing: 0,
    fontFamily: fontFamily,
  );

  static final TextStyle heading4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
    fontFamily: fontFamily,
  );

  static final TextStyle heading5 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
    fontFamily: fontFamily,
  );

  static final TextStyle heading6 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0,
    fontFamily: fontFamily,
  );

  // ==================== Body Text ====================

  static final TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
    letterSpacing: 0.15,
    fontFamily: fontFamily,
  );

  static final TextStyle body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.5,
    letterSpacing: 0.15,
    fontFamily: fontFamily,
  );

  // ==================== Subtitles ====================

  // static const TextStyle subtitle1 = TextStyle(
  //   fontSize: 16,
  //   fontWeight: FontWeight.w500,
  //   height: 1.5,
  //   letterSpacing: 0.15,
  //   fontFamily: fontFamily,
  // );

  // static const TextStyle subtitle2 = TextStyle(
  //   fontSize: 14,
  //   fontWeight: FontWeight.w500,
  //   height: 1.5,
  //   letterSpacing: 0.1,
  //   fontFamily: fontFamily,
  // );

  // // ==================== Captions & Overlines ====================

  // static const TextStyle caption = TextStyle(
  //   fontSize: 12,
  //   fontWeight: FontWeight.normal,
  //   height: 1.4,
  //   letterSpacing: 0.4,
  //   fontFamily: fontFamily,
  // );

  // static const TextStyle overline = TextStyle(
  //   fontSize: 10,
  //   fontWeight: FontWeight.w500,
  //   height: 1.6,
  //   letterSpacing: 1.5,
  //   fontFamily: fontFamily,
  // );

  // // ==================== Button Text ====================

  // static const TextStyle button = TextStyle(
  //   fontSize: 14,
  //   fontWeight: FontWeight.w600,
  //   height: 1.2,
  //   letterSpacing: 0.75,
  //   fontFamily: fontFamily,
  // );

  // static const TextStyle buttonLarge = TextStyle(
  //   fontSize: 16,
  //   fontWeight: FontWeight.w600,
  //   height: 1.2,
  //   letterSpacing: 0.75,
  //   fontFamily: fontFamily,
  // );

  // // ==================== Helper Methods ====================

  // /// Get text style with custom color
  // static TextStyle withColor(TextStyle style, Color color) {
  //   return style.copyWith(color: color);
  // }

  // /// Get text style for light theme
  // static TextStyle forLight(TextStyle style) {
  //   return style.copyWith(color: AppColors.textPrimaryLight);
  // }

  // /// Get text style for dark theme
  // static TextStyle forDark(TextStyle style) {
  //   return style.copyWith(color: AppColors.textPrimaryDark);
  // }
}
