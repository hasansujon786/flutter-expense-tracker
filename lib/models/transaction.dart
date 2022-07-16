class Transaction {
  final String id;
  String title;
  double amount;
  DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}

final List<Transaction> demoTransactions = [
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
  ),
  Transaction(
    id: 't1',
    title: 'new show',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'new show',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'new show',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'new show',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'new show',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'new show',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'new show',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'new show',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'new show',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'new show',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'new show',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: 't1',
    title: 'new show',
    amount: 70.0,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
];
