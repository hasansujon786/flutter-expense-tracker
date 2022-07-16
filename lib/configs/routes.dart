import 'package:flutter/material.dart';
import '../pages/pages.dart';

// {> routes = const <String, WidgetBuilder>{}}
Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (ctx) => const HomePage(title: 'Expense Tracker'),
  // '/foo': (ctx) => const SliverScreen(),
};
