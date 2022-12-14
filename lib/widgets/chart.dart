import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/widgets/chart_bar.dart';

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
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTranscationvalues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: groupedTranscationvalues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'],
                    data['amount'],
                    totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
