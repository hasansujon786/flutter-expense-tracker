import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/ui/ui.dart';
import '../../../models/models.dart';

class NewTransactionInput extends StatefulWidget {
  final Function(Transaction) addNewTransaction;
  final Function onCloseModalBottomSheet;
  const NewTransactionInput({
    Key? key,
    required this.addNewTransaction,
    required this.onCloseModalBottomSheet,
  }) : super(key: key);

  @override
  State<NewTransactionInput> createState() => _NewTransactionInputState();
}

class _NewTransactionInputState extends State<NewTransactionInput> {
  var _transactionType = TransactionDataType.expanse;
  final _titleConroller = TextEditingController();
  final _amountConroller = TextEditingController();
  DateTime _choosenDate = DateTime.now();

  void _onSubmitData() {
    if (_titleConroller.text.isEmpty || _amountConroller.text.isEmpty) return;
    final title = _titleConroller.text;
    final amount = double.parse(_amountConroller.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: _choosenDate,
      type: _transactionType,
    );
    widget.addNewTransaction(newTx);
    widget.onCloseModalBottomSheet();
  }

  void _onShowDatePicker() {
    final DateTime today = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(today.year),
      lastDate: today,
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _choosenDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'What is the reason of your expanse?',
            ),
            controller: _titleConroller,
            /* onSubmitted: (_) => _onSubmitData(), */
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'What is the amount of your expanse?',
            ),
            controller: _amountConroller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            /* onSubmitted: (_) => _onSubmitData(), */
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.date_range,
                size: 28,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  DateFormat.yMEd().format(_choosenDate),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              TextButton(
                child: const Text('Change Date'),
                onPressed: _onShowDatePicker,
              )
            ],
          ),
          const SizedBox(height: 32),
          CustomSwitch<TransactionDataType>(
            onSelect: (selected) => _transactionType = selected,
            optionNames: const ['Expanse', 'Income'],
            options: const [TransactionDataType.expanse, TransactionDataType.income],
          ),
          const SizedBox(height: 32),
          Center(
            child: SizedBox(
              width: 240,
              height: 50,
              child: ElevatedButton(
                child: const Text(
                  'Add transaction',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                onPressed: _onSubmitData,
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewTransactionInputModal {
  static void open(BuildContext context, addNewTransaction) {
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
                NewTransactionInput(
                  addNewTransaction: addNewTransaction,
                  onCloseModalBottomSheet: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
