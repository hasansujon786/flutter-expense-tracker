import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartWeekdays extends StatelessWidget {
  const ChartWeekdays({Key? key, required this.lastWeekTransactions})
      : super(key: key);
  final List<Transaction> lastWeekTransactions;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalsum = 0.0;
      for (var i = 0; i < lastWeekTransactions.length; i++) {
        if (lastWeekTransactions[i].date.day == weekDay.day &&
            lastWeekTransactions[i].date.month == weekDay.month &&
            lastWeekTransactions[i].date.year == weekDay.year) {
          totalsum += lastWeekTransactions[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'total': totalsum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: groupedTransactionValues.map((item) {
            return Column(
              children: [
                Text('${item['day']}'),
                Text('${item['total']}'),
              ],
            );
          }).toList(),
        ),
        width: double.infinity,
        height: 100,
      ),
    );
  }
}
