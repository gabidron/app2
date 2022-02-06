import 'package:flutter/material.dart';

import 'transactions_list.dart';
import 'new_transaction.dart';
import '../models/transaction.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      date: DateTime.now(),
      price: 25.01,
      title: 'random staff 1',
    ),
    Transaction(
      id: '2',
      date: DateTime.now(),
      price: 25.01,
      title: 'random staaaff 2',
    ),
  ];
  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      date: DateTime.now(),
      price: amount,
      title: title,
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          addTransaction: _addTransaction,
        ),
        TransactionList(transactions: _userTransactions),
      ],
    );
  }
}
