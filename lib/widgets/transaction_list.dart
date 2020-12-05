import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? Column(
            children: [
              Text(
                'No transactions added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) => Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text('\$${userTransactions[index].amount}'),
                    ),
                  ),
                ),
                title: Text(
                  userTransactions[index].title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(userTransactions[index].date),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () =>
                      deleteTransaction(userTransactions[index].id),
                ),
              ),
            ),
            itemCount: userTransactions.length,
          );
  }
}
