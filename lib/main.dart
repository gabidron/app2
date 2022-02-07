import 'package:app2/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

import './widgets/transactions_list.dart';
import './models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onDoubleTap: () {},
          child: NewTransaction(addTransaction: _addTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('widget.title'),
        actions: [
          IconButton(
            onPressed: () => _startAddnewTransaction(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              child: Text('carousel'),
            ),
            TransactionList(transactions: _userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddnewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
