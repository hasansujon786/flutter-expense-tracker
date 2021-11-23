import 'package:expense_tracker/widgets/chart_weekdays.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showTransactionInputs(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext bottomSheetContext) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: Container(
            padding: const EdgeInsets.only(top: 24),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Colors.grey.shade100,
            ),
            child: Column(
              /* mainAxisAlignment: MainAxisAlignment.start, */
              /* mainAxisSize: MainAxisSize.min, */
              children: <Widget>[
                const Text(
                  'Create New Transaction',
                  style: TextStyle(fontSize: 22),
                ),
                NewTransaction(
                  addNewTransaction: _addNewTransaction,
                  onCloseModalBottomSheet: () => Navigator.pop(context),
                ),
                /* ElevatedButton( */
                /*   child: const Text('Close BottomSheet'), */
                /*   onPressed: () => Navigator.pop(context), */
                /* ) */
              ],
            ),
          ),
        );
      },
    );
  }

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'new show',
      amount: 70.0,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 50.0,
      date: DateTime.now().subtract(const Duration(days: 1)),
    )
  ];

  List<Transaction> get lastWeekTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      date: DateTime.now(),
      title: title,
      amount: amount,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ChartWeekdays(lastWeekTransactions: lastWeekTransactions),
            _userTransactions.isEmpty
                ? const SizedBox(
                    height: 200,
                    child: Center(
                      child: Text(
                        'no items',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                : TransactionList(transactions: _userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTransactionInputs(context);
        },
        tooltip: 'Create transaction',
        child: const Icon(Icons.add),
      ),
    );
  }
}
