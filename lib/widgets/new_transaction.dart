import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final textController = TextEditingController();
  final amountController = TextEditingController();
  final Function addtx;

  NewTransaction(this.addtx);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: textController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            TextButton(
              child: Text('Add Transaction'),
              onPressed: () {
                addtx(
                  textController.text,
                  double.parse(amountController.text),
                );
              },
              style: TextButton.styleFrom(primary: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
