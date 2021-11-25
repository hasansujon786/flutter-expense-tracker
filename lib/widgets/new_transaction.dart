import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction(
      {Key? key,
      required this.addNewTransaction,
      required this.onCloseModalBottomSheet})
      : super(key: key);
  final Function addNewTransaction;
  final Function onCloseModalBottomSheet;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
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
    widget.addNewTransaction(title, amount, _choosenDate);
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
          Center(
            child: ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Add Transaction',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: _onSubmitData,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
