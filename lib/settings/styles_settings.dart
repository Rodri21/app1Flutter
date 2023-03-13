import 'package:flutter/material.dart';

class StylesSettings {
  BuildContext? context;

    static ThemeData darkTheme(BuildContext context) {
      final theme = ThemeData.dark();

      ColorScheme colorScheme = const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFE5B84A),
        onPrimary: Color(0xFF000000),
        secondary: Color(0xFF593C8F),
        onSecondary: Color(0xFFFFFFFF),
        error: Color(0xFFCF6679),
        onError: Color(0xFFFFFFFF),
        background: Color(0xFF121212),
        onBackground: Color(0xFFFFFFFF),
        surface: Color(0xFF1E1E1E),
        onSurface: Color(0xFFFFFFFF),
      );

      final ThemeData darkTheme = ThemeData.from(
        colorScheme: colorScheme,
        textTheme: theme.textTheme,
      ).copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

      return darkTheme;
    }


  static ThemeData lightTheme(BuildContext context) {
    final theme = ThemeData.light();

    ColorScheme colorScheme = const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF117533),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFF7C9B3),
      onSecondary: Color(0xFF000000),
      error: Color(0xFFD32F2F),
      onError: Color(0xFFFFFFFF),
      background: Color(0xFFE5E5E5),
      onBackground: Color(0xFF333333),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF4E7BA9),
    );

    final ThemeData lightTheme = ThemeData.from(
      colorScheme: colorScheme,
      textTheme: theme.textTheme,
    ).copyWith(
      scaffoldBackgroundColor: const Color(0xFFF7F7F7),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return lightTheme;
  }

  static ThemeData spaceTheme(BuildContext context) {
    final theme = ThemeData.dark();

    ColorScheme colorScheme = const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFFF5722),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFFFC107),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFD32F2F),
      onError: Color(0xFFFFFFFF),
      onBackground: Color(0xFFFFFFFF),
      background: Color(0xFFA78078),
      surface: Color(0xFFEEEEEE),
      onSurface: Color(0xFFFFFFFF),
    );

    final ThemeData spaceTheme = ThemeData.from(
      colorScheme: colorScheme,
      textTheme: theme.textTheme,
    ).copyWith(
      scaffoldBackgroundColor: Color.fromARGB(206, 46, 9, 9),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return spaceTheme;
  }



}
