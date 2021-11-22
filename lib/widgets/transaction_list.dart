import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.transactions})
      : super(key: key);
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return TransactionListItem(transaction: transactions[index]);
        },
        itemCount: transactions.length,
      ),
    );
  }
}

class TransactionListItem extends StatelessWidget {
  TransactionListItem({Key? key, required this.transaction}) : super(key: key);
  final Transaction transaction;
  final dateFormater = DateFormat().add_yMMMd();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: Text(
            '\$${transaction.amount.toStringAsFixed(2)}',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              transaction.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              dateFormater.format(transaction.date),
              style: TextStyle(color: Colors.grey.shade500),
            )
          ],
        )
      ],
    );
  }
}
