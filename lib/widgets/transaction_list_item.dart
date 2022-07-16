import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  TransactionListItem(
      {Key? key, required this.transaction, required this.onDeleteTransaction})
      : super(key: key);
  final Transaction transaction;
  final Function onDeleteTransaction;
  final dateFormater = DateFormat().add_yMMMd();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        Navigator.of(context).pushNamed('/foo');
      },
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
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => onDeleteTransaction(transaction.id),
      ),
    );
  }
}

