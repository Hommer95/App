import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';

main() => runApp(const ExpensesesApp());

class ExpensesesApp extends StatelessWidget {
  const ExpensesesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tenis de Corrida',
        values: 310.76,
        date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta de Luz', values: 211.30, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Despesas Pessoais')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black54,
                        width: 2,
                      )),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        tr.values.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tr.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          tr.date.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
