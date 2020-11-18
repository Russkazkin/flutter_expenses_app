import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransactions
          .map((tx) => Card(
        child: Row(
          children: [
            Container(
              child: Text(
                '\$${tx.amount}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple),
              ),
              margin: EdgeInsets.symmetric(
                  vertical: 10, horizontal: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  )),
            ),
            Column(
              children: [
                Text(
                  tx.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat.yMMMd().format(tx.date),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ],
        ),
      ))
          .toList(),
    );
  }
}
