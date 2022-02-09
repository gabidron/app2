import 'package:app2/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import "./chart.dart";

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.year == weekDay.year &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.day == weekDay.day) {
          totalSum += recentTransactions[i].price;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).toString().substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue += element['amount'] as num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 375,
        child: Card(
          elevation: 6,
          margin: const EdgeInsets.all(15),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...groupedTransactionValues.map((e) {
                  return ChartBar(
                    amount: e['amount'] as double,
                    label: e['day'] as String,
                    ratio: (e['amount'] as double) /
                        (totalSpending != 0 ? totalSpending : 1),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
