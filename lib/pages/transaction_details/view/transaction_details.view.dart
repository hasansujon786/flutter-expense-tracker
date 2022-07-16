import 'package:flutter/material.dart';

class TransactionDetailsView extends StatelessWidget {
  final String title;
  const TransactionDetailsView ({Key? key, required this.title}) : super(key: key);

  static const routeName = '/transaction_details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
