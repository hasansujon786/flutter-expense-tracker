import 'package:expense_tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'quicksand',
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'quicksand',
          ),
        ),
      ),
      home: const HomeScreen(title: 'Expense Tracker'),
    );
  }
}
