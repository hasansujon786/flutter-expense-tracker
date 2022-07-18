enum TransactionDataType { expanse, income }

class Transaction {
  final String id;
  String title;
  double amount;
  DateTime date;
  TransactionDataType type;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    this.type = TransactionDataType.income,
  });
}

final List<Transaction> demoTransactions = [
  Transaction(
    id: 't1',
    title: 'Title text',
    type: TransactionDataType.expanse,
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't2',
    title: 'Weekly Groceries',
    amount: 50.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'Untitled',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'xxxxxxxxxxxxxxxxxxxxx',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'xxxxxxxxxxxxxxxxxxxxx',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'xxxxxxxxxxxxxxxxxxxxx',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'xxxxxxxxxxxxxxxxxxxxx',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'xxxxxxxxxxxxxxxxxxxxx',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'xxxxxxxxxxxxxxxxxxxxx',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'xxxxxxxxxxxxxxxxxxxxx',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'xxxxxxxxxxxxxxxxxxxxx',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'xxxxxxxxxxxxxxxxxxxxx',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'xxxxxxxxxxxxxxxxxxxxx',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'xxxxxxxxxxxxxxxxxxxxx',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
];
