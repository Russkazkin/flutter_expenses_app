import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.userTransaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text('\$${userTransaction.amount}'),
            ),
          ),
        ),
        title: Text(
          userTransaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(userTransaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
          onPressed: () =>
              deleteTransaction(userTransaction.id),
          label: const Text('Delete'),
          textColor: Theme.of(context).errorColor,
          icon: const Icon(Icons.delete_outline),
        )
            : IconButton(
          icon: Icon(
            Icons.delete_outline,
            color: Theme.of(context).errorColor,
          ),
          onPressed: () =>
              deleteTransaction(userTransaction.id),
        ),
      ),
    );
  }
}