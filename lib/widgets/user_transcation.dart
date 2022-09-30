import 'package:flutter/material.dart';
import 'package:untitled/widgets/new_transcation.dart';
import 'package:untitled/widgets/transcation_list.dart';
import '../models/transcation.dart';

class UserTranscation extends StatefulWidget {
  @override
  State<UserTranscation> createState() => _UserTranscationState();
}

class _UserTranscationState extends State<UserTranscation> {
  final List<Transcation> _userTranscations = [
    Transcation(
      id: 't1',
      title: "new Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transcation(
      id: 't2',
      title: "Grociers",
      amount: 16.54,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transcation(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTranscations.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTranscation(_addNewTransaction),
        TranscationList(_userTranscations),
      ],
    );
  }
}
