// import 'dart:js';

// ignore_for_file: non_constant_identifier_names

import 'package:expenses/compenents/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'compenents/transaction_list.dart';
import 'models/transaction.dart';

main() => runApp(const ExpensesesApp());

class ExpensesesApp extends StatelessWidget {
  const ExpensesesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tenis de Corrida',
        values: 310.76,
        date: DateTime.now()),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      values: 211.30,
      date: DateTime.now(),
    ),
  ];

  // ignore: unused_element
  _addTransaction(String title, double values) {
    final newTransacion = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      values: values,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransacion);
    });
  }

  // ignore: unused_element
  _opentransactionFormModal() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          // ignore: avoid_types_as_parameter_names
          return TransactionForm(
            Null,
            // ignore: avoid_types_as_parameter_names
            onSubmit: (String, double) {},
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _opentransactionFormModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Grafico'),
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
