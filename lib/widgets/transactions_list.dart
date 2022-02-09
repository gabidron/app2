import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  Function deleteTransaction;
  TransactionList(
      {Key? key, required this.transactions, required this.deleteTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.isEmpty
            ? [
                const Text('Add a new transqaction'),
                const SizedBox(height: 20),
                SizedBox(
                  height: 400,
                  child: Image.asset('assets/images/waiting.png'),
                ),
              ]
            : transactions.map((tx) {
                return TransactionCard(
                  transaction: tx,
                  deleteTransaction: deleteTransaction,
                );
              }).toList());
  }
}
