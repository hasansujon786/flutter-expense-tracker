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
    return ListTile(
      horizontalTitleGap: 8,
      leading: CircleAvatar(
        radius: 30.0,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: FittedBox(child: Text('\$${transaction.amount}')),
        ),
      ),
      title: Text(
        transaction.title,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(
        dateFormater.format(transaction.date),
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
