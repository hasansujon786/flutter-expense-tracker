import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key, required this.addNewTransaction}) : super(key: key);
  final Function addNewTransaction;

  final titleConroller = TextEditingController();
  final amountConroller = TextEditingController();

  void submitData() {
    final title = titleConroller.text;
    final amount = double.parse(amountConroller.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    addNewTransaction(title, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
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
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              child: const Text('Add Transaction'),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
