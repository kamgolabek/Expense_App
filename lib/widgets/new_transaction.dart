import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _newTransactionHandler;

  NewTransaction(this._newTransactionHandler);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final titleEntered = titleController.text;
    final amountEntered = double.parse(amountController.text);

    if(titleEntered.isEmpty || amountEntered <= 0){
      return;
    }
    _newTransactionHandler(
      titleEntered,
      amountEntered,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: submitData,
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
