import 'package:flutter/material.dart';
import '../pages/pages.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (ctx) => const RootNavigation(),
  TransactionDetailsView.routeName: (ctx) => const TransactionDetailsView(title: 'Expanse Details'),
};
