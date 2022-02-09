import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTransaction;
  const TransactionCard({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 0,
          ),
          child: Text(
            transaction.price.toStringAsFixed(2) + '\$',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.title.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateFormat('dd.MM.yyyy').format(transaction.date),
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () => deleteTransaction(transaction.id),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ],
        ))
      ]),
    );
  }
}
