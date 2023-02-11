import 'package:flutter/material.dart';

ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: Colors.blueGrey, primary: Colors.blueGrey);

/// Contains the theme for the application.
ThemeData themeData() {
  return ThemeData(
    colorScheme: colorScheme,
    primaryColor: colorScheme.primary,
    unselectedWidgetColor: colorScheme.primary,

    appBarTheme: AppBarTheme(
      foregroundColor: colorScheme.onPrimary,
      backgroundColor: colorScheme.primary,
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: colorScheme.primary,
        fontSize: 12,
      ),
      bodyMedium: TextStyle(
       color: colorScheme.primary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorScheme.primary),
        foregroundColor: MaterialStateProperty.all<Color>(colorScheme.onPrimary),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
        minimumSize: MaterialStateProperty.all(const Size(100, 50)),
        textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 20))
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => colorScheme.primary)
    ),
  );
}