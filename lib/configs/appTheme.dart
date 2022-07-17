import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    primarySwatch: Colors.deepPurple,
    /* visualDensity: VisualDensity.adaptivePlatformDensity, */
    fontFamily: 'rubik',
    appBarTheme: const AppBarTheme(centerTitle: true),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.blueGrey,
      backgroundColor: Colors.white,
    ),
    // colorScheme: const ColorScheme.light(),
  );
}
