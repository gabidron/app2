import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  const NewTransaction({Key? key, required this.addTransaction})
      : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  var _selectedDate;
  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) setState(() => _selectedDate = value);
    });
  }

  void submitData() {
    String inputText = _titleController.text;
    double amount = double.parse(_amountController.text);

    if (inputText.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    } else {
      widget.addTransaction(
        _titleController.text,
        double.parse(_amountController.text),
        _selectedDate,
      );
      Navigator.of(context).pop();
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
            controller: _titleController,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: const InputDecoration(label: Text('Amount')),
            controller: _amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submitData(),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                _selectedDate == null
                    ? 'No date selected'
                    : DateFormat('dd.MM.yyyy').format(_selectedDate),
              ),
              TextButton(
                  onPressed: () => _presentDatePicker(context),
                  child: Text(
                    'Select date:',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ))
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
            child: ElevatedButton(
              onPressed: () => submitData(),
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
