import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _primaryLightColor = Color(0xFF6200EE);
  static const Color _primaryDarkColor = Color(0xFFBB86FC);

  static const Color _secondaryLightColor = Color(0xFF03DAC5);
  static const Color _secondaryDarkColor = Color(0xFF03DAC5);

  static const Color _backgroundLightColor = Color(0xFFF5F5F5);
  static const Color _backgroundDarkColor = Color(0xFF121212);

  static const Color _surfaceLightColor = Colors.white;
  static const Color _surfaceDarkColor = Color(0xFF1E1E1E);

  static const Color _onPrimaryLightColor = Colors.white;
  static const Color _onPrimaryDarkColor = Colors.black;

  static const Color _onSecondaryLightColor = Colors.black;
  static const Color _onSecondaryDarkColor = Colors.black;

  static const Color _onBackgroundLightColor = Colors.black;
  static const Color _onBackgroundDarkColor = Colors.white;

  static const Color _onSurfaceLightColor = Colors.black;
  static const Color _onSurfaceDarkColor = Colors.white;

  static const Color _errorLightColor = Color(0xFFB00020);
  static const Color _errorDarkColor = Color(0xFFCF6679);

  static const Color _hoverColorLight = Color(0x0D000000); // 5% opacity black
  static const Color _hoverColorDark = Color(0x0DFFFFFF); // 5% opacity white

  // Gradient colors for backgrounds:
  // Light mode: subtle teal/bluish background
  static const List<Color> _gradientLightColors = [
    Color(0xFFE0F7FA),
    Color(0xFFE1F5FE),
    Color(0xFFE8F5E9),
  ];

  // Dark mode: Yellow → Blue
  static const List<Color> _gradientDarkColors = [
    Color(0xFFFFC107), // Yellow
    Color(0xFF2196F3), // Blue
  ];

  // Social media colors
  static const Color linkedInColor = Color(0xFF0077B5);
  static const Color githubColor = Color(0xFF333333);
  static const Color gmailColor = Color(0xFFEA4335);
  static const Color scholarColor = Color(0xFF4285F4);

  // LIGHT THEME
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: _primaryLightColor,
        secondary: _secondaryLightColor,
        surface: _surfaceLightColor,
        onPrimary: _onPrimaryLightColor,
        onSecondary: _onSecondaryLightColor,
        onSurface: _onSurfaceLightColor,
        error: _errorLightColor,
      ),
      scaffoldBackgroundColor: _backgroundLightColor,
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: _onPrimaryLightColor,
          backgroundColor: _primaryLightColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _primaryLightColor,
          side: const BorderSide(color: _primaryLightColor),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryLightColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      iconTheme: const IconThemeData(color: _primaryLightColor, size: 24),
      appBarTheme: const AppBarTheme(
        backgroundColor: _surfaceLightColor,
        foregroundColor: _onSurfaceLightColor,
        elevation: 0,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: _primaryLightColor.withOpacity(0.1),
        labelStyle: const TextStyle(color: _primaryLightColor),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  // DARK THEME
  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: _primaryDarkColor,
        secondary: _secondaryDarkColor,
        surface: _surfaceDarkColor,
        onPrimary: _onPrimaryDarkColor,
        onSecondary: _onSecondaryDarkColor,
        onSurface: _onSurfaceDarkColor,
        error: _errorDarkColor,
      ),
      scaffoldBackgroundColor: _backgroundDarkColor,
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      cardTheme: CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: _surfaceDarkColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: _onPrimaryDarkColor,
          backgroundColor: _primaryDarkColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _primaryDarkColor,
          side: const BorderSide(color: _primaryDarkColor),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryDarkColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      iconTheme: const IconThemeData(color: _primaryDarkColor, size: 24),
      appBarTheme: const AppBarTheme(
        backgroundColor: _surfaceDarkColor,
        foregroundColor: _onSurfaceDarkColor,
        elevation: 0,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: _primaryDarkColor.withOpacity(0.1),
        labelStyle: const TextStyle(color: _primaryDarkColor),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  // Returns the correct gradient color set
  static List<Color> gradientColors(bool isDarkMode) {
    return isDarkMode ? _gradientDarkColors : _gradientLightColors;
  }

  // Returns the correct hover color
  static Color hoverColor(bool isDarkMode) {
    return isDarkMode ? _hoverColorDark : _hoverColorLight;
  }
}
