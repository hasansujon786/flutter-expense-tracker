import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'EXT'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        id: 't1', title: 'new show', amount: 70.0, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Weekly Groceries', amount: 50.0, date: DateTime.now())
  ];

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
            Card(
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Text('hello'),
                width: double.infinity,
                height: 100,
              ),
            ),
            TransactionList(
              transactions: _userTransactions,
            )
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
