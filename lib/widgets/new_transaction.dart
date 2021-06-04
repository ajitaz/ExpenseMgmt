import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  NewTransaction(this.addtx);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final textController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = textController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addtx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text('No Date Chosen!'),
                  TextButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Add Transaction'),
              onPressed: submitData,
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(color: Colors.white),
                elevation: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
