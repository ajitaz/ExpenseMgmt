import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(PersonalExpense());

class PersonalExpense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      title: 'Flutter App',
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      amount: 200,
      title: 'New shoes',
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      amount: 300,
      title: 'Weekly Groceries',
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                  ),
                  TextButton(
                    child: Text('Add Transaction'),
                    onPressed: () {},
                    style: TextButton.styleFrom(primary: Colors.purple),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: transaction
                .map(
                  (tx) => Card(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          child: Card(
                            child: Text(
                              '\$${tx.amount}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(tx.date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
