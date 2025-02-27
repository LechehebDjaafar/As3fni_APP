import 'package:flutter/material.dart';

class AppTheme {
  // ألوان التطبيق الرئيسية
  static const Color primary = Color(0xFF1E88E5);
  static const Color secondary = Color(0xFF4CAF50);
  static const Color accent = Color(0xFFFFA726);
  static const Color background = Color(0xFFF5F5F5);
  static const Color error = Color(0xFFE53935);

  // أنماط النصوص
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
    fontFamily: 'Cairo',
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
    fontFamily: 'Cairo',
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    color: Colors.black87,
    fontFamily: 'Cairo',
  );

  // أنماط الأزرار
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primary,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  // أنماط البطاقات
  static final CardTheme cardTheme = CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );

  // ثيم التطبيق الكامل
  static ThemeData theme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: background,
    fontFamily: 'Cairo',
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      secondary: secondary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: primaryButtonStyle,
    ),
    cardTheme: cardTheme,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
  );
}
