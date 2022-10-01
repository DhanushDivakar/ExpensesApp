import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transcation.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTranscation;

  Chart(this.recentTranscation);

  List<Map<String, Object>> get groupedTranscationvalues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < recentTranscation.length; i++) {
        if (recentTranscation[i].date.day == weekDay.day &&
            recentTranscation[i].date.month == weekDay.month &&
            recentTranscation[i].date.year == weekDay.year) {
          totalSum += recentTranscation[i].amount;
        }
      }
      print("HI");
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {'day': DateFormat.E().format(weekDay).substring(0, 1), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTranscationvalues.map((data) {
          return Text('${data['day']}: ${data['amount']}');
        }).toList(),
      ),
    );
  }
}
