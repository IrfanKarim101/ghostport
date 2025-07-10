import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.deepPurple,
      secondary: Colors.amber,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: Colors.black87,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(color: Colors.black87, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
      titleMedium: TextStyle(color: Colors.black87, fontSize: 16),
      titleSmall: TextStyle(color: Colors.black54, fontSize: 14),
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(color: Colors.black45, fontSize: 12),
      labelSmall: TextStyle(color: Colors.black38, fontSize: 10),
    ),
    iconTheme: const IconThemeData(color: Colors.deepPurple),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple),
      ),
      labelStyle: TextStyle(color: Colors.deepPurple),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF0A1124), // Deep dark blue
    scaffoldBackgroundColor: const Color(0xFF0A1124), // Deep dark blue
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF101A36), // Slightly lighter deep blue
      foregroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF0A1124), // Deep dark blue
      secondary: Color(0xFF1B2A4B),
      surface: Color(0xFF101A36),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: Color(0xFFB0C4DE),
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ), // Light blue-grey
      bodyLarge: TextStyle(color: Colors.white70, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white60, fontSize: 14),
      titleMedium: TextStyle(color: Colors.white70, fontSize: 16),
      titleSmall: TextStyle(color: Colors.white60, fontSize: 14),
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(color: Colors.white38, fontSize: 12),
      labelSmall: TextStyle(color: Colors.white24, fontSize: 10),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF1B2A4B),
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF1B2A4B),
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF1B2A4B)),
      ),
      labelStyle: TextStyle(color: Colors.white),
    ),
  );
}
