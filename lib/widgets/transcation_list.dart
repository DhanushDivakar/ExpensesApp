import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transcation.dart';
//helloo
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No trancsation added",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/car.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FittedBox(child: Text('\$${transactions[index].amount}',

                      ),

                      ),
                    ),
                    ),
                    title: Text(transactions[index].title,
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                    ),
                    subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),

                    trailing: MediaQuery.of(context).size.width > 460 ? FlatButton.icon(
                      textColor: Theme.of(context).errorColor,
                        icon: Icon(Icons.delete),
                        label: Text("Delete"),
                        onPressed: () =>deleteTx(transactions[index].id)
                    ) : IconButton(icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () =>deleteTx(transactions[index].id)
                      ,)

                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
