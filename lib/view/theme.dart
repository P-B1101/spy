import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light(
    String fontfamily, {
    Iterable<ThemeExtension<dynamic>>? extensions,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF2B398E),
      primary: const Color(0xFF2B398E),
      surface: const Color(0xFFFFFFFF),
      error: const Color(0xFFC53030),
    );
    const disabledColor = Color(0xFFD2D2D2);
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFF4F4F4),
      primaryColor: colorScheme.primary,
      primaryColorLight: const Color(0xFFE7EAFF),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        },
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFFFFFFFF),
        shadowColor: Colors.black.withOpacity(.2),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF232323),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF4A4A4A),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(
          color: colorScheme.primary,
          size: 24,
        ),
        unselectedIconTheme: IconThemeData(
          color: colorScheme.primary,
          size: 24,
        ),
        selectedLabelStyle: TextStyle(
          fontFamily: fontfamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: colorScheme.primary,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: fontfamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF8891C9),
        ),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xFF8891C9),
      ),
      shadowColor: Colors.black.withOpacity(.08),
      cardTheme: CardTheme(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black.withOpacity(.04),
      ),
      extensions: [
        if (extensions != null) ...extensions,
      ],
      cardColor: Colors.white,
      colorScheme: colorScheme,
      disabledColor: disabledColor,
      useMaterial3: true,
      fontFamily: fontfamily,
      iconTheme: const IconThemeData(color: Color(0xFF808080)),
      dividerTheme: const DividerThemeData(color: Color(0x14000000)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Color(0XFF232323),
        ),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 34,
          color: Color(0XFF232323),
        ),
        displaySmall: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Color(0XFF232323),
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: Color(0XFF232323),
        ),
        labelMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Color(0XFF232323),
        ),
        headlineLarge: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 10,
          color: Color(0XFF232323),
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Color(0XFF232323),
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Color(0XFF232323),
        ),
        labelLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Color(0XFF4A4A4A),
        ),
        displayLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Color(0XFF4A4A4A),
        ),
        titleSmall: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Color(0XFF232323),
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Color(0XFF232323),
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Color(0XFF232323),
        ),
        labelSmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Color(0XFF232323),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.black,
        modalBarrierColor: Colors.black.withOpacity(.7),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        isDense: true,
        errorStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: colorScheme.error,
        ),
        contentPadding: const EdgeInsetsDirectional.only(
          top: 20,
          bottom: 20,
          start: 16,
          end: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFFEDEDED),
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFFEDEDED),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: disabledColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
