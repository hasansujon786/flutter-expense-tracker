import 'package:flutter/material.dart';

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
  final titleConroller = TextEditingController();
  final amountConroller = TextEditingController();

  void submitData() {
    final title = titleConroller.text;
    final amount = double.parse(amountConroller.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.addNewTransaction(title, amount);
    widget.onCloseModalBottomSheet();
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
            controller: titleConroller,
            onSubmitted: (_) => submitData(),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'What is the amount of your expanse?',
            ),
            controller: amountConroller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submitData(),
          ),
          TextButton(
            child: const Text('Add Transaction'),
            onPressed: submitData,
          )
        ],
      ),
    );
  }
}
