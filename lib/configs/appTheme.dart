import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    primarySwatch: Colors.deepPurple,
    /* visualDensity: VisualDensity.adaptivePlatformDensity, */
    fontFamily: 'quicksand',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontFamily: 'quicksand',
      ),
    ),
  );
}
