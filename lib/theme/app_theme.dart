import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFF137FEC); // Biru yang Anda gunakan
  static const inactiveLight = Color(0xFF6C6C6C); // Abu-abu light mode
  static const inactiveDark = Color(0xFF9E9E9E); // Abu-abu dark mode

  static const backgroundLight = Color(0xFFF5F5F5); // Latar belakang light
  static const surfaceLight = Colors.white; // Latar belakang card/nav light

  static const backgroundDark = Color(0xFF121212); // Latar belakang dark
  static const surfaceDark = Color(0xFF1E1E1E); // Latar belakang card/nav dark
}


class AppTheme {

  // --- 1. LIGHT THEME ---
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,

    // Definisikan ColorScheme secara manual (bukan fromSeed)
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.primary,
      onSecondary: Colors.white,
      background: AppColors.backgroundLight,
      onBackground: Colors.black,
      surface: AppColors.surfaceLight,
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.white,
    ),

    // Tema Font
    textTheme: GoogleFonts.nunitoSansTextTheme(
      ThemeData.light().textTheme,
    ),

    // Tema AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceLight,
      foregroundColor: Colors.black,
      elevation: 0,
    ),

    // Tema Tombol
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    // Tema Navigation Bar (diperbarui dengan iconTheme)
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surfaceLight,
      indicatorColor: Colors.transparent,
      // Tema untuk Ikon
      iconTheme: WidgetStateProperty.resolveWith((states) {
        return IconThemeData(
          color: states.contains(WidgetState.selected)
              ? AppColors.primary
              : AppColors.inactiveLight,
        );
      }),
      // Tema untuk Teks Label
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        return TextStyle(
          fontSize: 12,
          fontWeight: states.contains(WidgetState.selected)
              ? FontWeight.w600
              : FontWeight.normal,
          color: states.contains(WidgetState.selected)
              ? AppColors.primary
              : AppColors.inactiveLight,
        );
      }),
    ),
  );

  // --- 2. DARK THEME ---
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,

    // Definisikan ColorScheme
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.primary,
      onSecondary: Colors.white,
      background: AppColors.backgroundDark,
      onBackground: Colors.white,
      surface: AppColors.surfaceDark,
      onSurface: Colors.white,
      error: Colors.redAccent,
      onError: Colors.black,
    ),

    // Tema Font
    textTheme: GoogleFonts.nunitoSansTextTheme(
      ThemeData.dark().textTheme,
    ),

    // Tema AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    // Tema Tombol
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    // Tema Navigation Bar
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surfaceDark,
      indicatorColor: Colors.transparent,
      // Tema untuk Ikon
      iconTheme: WidgetStateProperty.resolveWith((states) {
        return IconThemeData(
          color: states.contains(WidgetState.selected)
              ? AppColors.primary
              : AppColors.inactiveDark,
        );
      }),
      // Tema untuk Teks Label
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        return TextStyle(
          fontSize: 12,
          fontWeight: states.contains(WidgetState.selected)
              ? FontWeight.w600
              : FontWeight.normal,
          color: states.contains(WidgetState.selected)
              ? AppColors.primary
              : AppColors.inactiveDark,
        );
      }),
    ),
  );
}