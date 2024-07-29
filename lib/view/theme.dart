import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light(
    String fontfamily, {
    Iterable<ThemeExtension<dynamic>>? extensions,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF2B398E),
      primary: const Color(0xFF0A1265),
      surface: const Color(0xFFFFFFFF),
      error: const Color(0xFFC53030),
    );
    const disabledColor = Color(0xFFD2D2D2);
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      primaryColor: colorScheme.primary,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        },
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
        // bodyLarge: TextStyle(
        //   fontWeight: FontWeight.w600,
        //   fontSize: 20,
        //   color: Color(0XFF232323),
        // ),
        // headlineMedium: TextStyle(
        //   fontWeight: FontWeight.bold,
        //   fontSize: 34,
        //   color: Color(0XFF232323),
        // ),
        displaySmall: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Color(0XFF0F0F0F),
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 24,
          color: Color(0XFF0F0F0F),
        ),
        // labelMedium: TextStyle(
        //   fontWeight: FontWeight.w500,
        //   fontSize: 16,
        //   color: Color(0XFF232323),
        // ),
        // headlineLarge: TextStyle(
        //   fontWeight: FontWeight.w500,
        //   fontSize: 10,
        //   color: Color(0XFF232323),
        // ),
        // titleLarge: TextStyle(
        //   fontWeight: FontWeight.w600,
        //   fontSize: 18,
        //   color: Color(0XFF232323),
        // ),
        // titleMedium: TextStyle(
        //   fontWeight: FontWeight.bold,
        //   fontSize: 16,
        //   color: Color(0XFF232323),
        // ),
        labelLarge: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: Color(0XFF0F0F0F),
        ),
        displayLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Color(0XFF0F0F0F),
        ),
        titleSmall: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Color(0XFF0F0F0F),
        ),
        // bodyMedium: TextStyle(
        //   fontWeight: FontWeight.w600,
        //   fontSize: 12,
        //   color: Color(0XFF232323),
        // ),
        // bodySmall: TextStyle(
        //   fontWeight: FontWeight.w500,
        //   fontSize: 12,
        //   color: Color(0XFF232323),
        // ),
        labelSmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Color(0XFF0F0F0F),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.black,
        modalBarrierColor: Colors.black.withOpacity(.7),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        isDense: true,
        fillColor: const Color(0xFFF0F2F5),
        hintStyle: const TextStyle(
          color: Color(0xFFBABABA),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        errorStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: colorScheme.error,
        ),
        contentPadding: const EdgeInsetsDirectional.only(
          top: 18,
          bottom: 18,
          start: 12,
          end: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}