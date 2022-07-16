import 'package:flutter/material.dart';
import '../pages/pages.dart';
import 'constants.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (ctx) => const HomeView(title: Constants.appName),
  TransactionDetailsView.routeName: (ctx) => const TransactionDetailsView(title: 'Expanse Details'),
};
