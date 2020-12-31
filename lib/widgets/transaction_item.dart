import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.userTransaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.deepOrange,
      Colors.purple,
      Colors.pinkAccent,
    ];

    _bgColor = availableColors[Random().nextInt(4)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text('\$${widget.userTransaction.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.userTransaction.title,
          style: Theme
              .of(context)
              .textTheme
              .headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.userTransaction.date),
        ),
        trailing: MediaQuery
            .of(context)
            .size
            .width > 360
            ? FlatButton.icon(
          onPressed: () =>
              widget.deleteTransaction(widget.userTransaction.id),
          label: const Text('Delete'),
          textColor: Theme
              .of(context)
              .errorColor,
          icon: const Icon(Icons.delete_outline),
        )
            : IconButton(
          icon: Icon(
            Icons.delete_outline,
            color: Theme
                .of(context)
                .errorColor,
          ),
          onPressed: () =>
              widget.deleteTransaction(widget.userTransaction.id),
        ),
      ),
    );
  }
}