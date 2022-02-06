import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTransaction;

  NewTransaction({Key? key, required this.addTransaction}) : super(key: key);

  void submitData() {
    String inputText = titleController.text;
    double amount = double.parse(amountController.text);

    if (inputText.isEmpty || amount <= 0) {
      return;
    } else {
      addTransaction(
        titleController.text,
        double.parse(amountController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(label: Text('Title')),
            controller: titleController,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: const InputDecoration(label: Text('Amount')),
            controller: amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submitData(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
            child: ElevatedButton(
                onPressed: () => submitData(),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
