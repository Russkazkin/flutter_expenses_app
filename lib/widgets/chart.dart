import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> resentTransactions;

  Chart(this.resentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < resentTransactions.length; i++) {
        if (resentTransactions[i].date.day == weekDay.day &&
            resentTransactions[i].date.month == weekDay.month &&
            resentTransactions[i].date.year == weekDay.year) {
          totalSum += resentTransactions[i].amount;
        }
      }

      print(DateFormat.E(weekDay));
      print(totalSum);

      return {
        'day': DateFormat.E(weekDay),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
