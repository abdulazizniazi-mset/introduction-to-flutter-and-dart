import 'package:flutter/material.dart';
import 'package:introduction_to_flutter_and_dart/data/styles.dart';
import 'package:introduction_to_flutter_and_dart/screens/home.dart';
import 'package:introduction_to_flutter_and_dart/screens/tip_calculator.dart';
import 'package:provider/provider.dart';

import '../util/tip_calculator_util.dart';

class AssignmentList extends StatefulWidget {
  const AssignmentList({super.key});

  @override
  State<AssignmentList> createState() => _AssignmentListState();
}

class _AssignmentListState extends State<AssignmentList> {
  var assignmentList = [
    ChangeNotifierProvider(
      create: (_)=>TipCalculatorUtil(),
      child: const TipCalculator(),
    ),
    const HomePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Flutter Way"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => assignmentList[index])),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Assignment ${index + 1}", style: TextStyles.body),
            ),
          ),
        ),
        itemCount: 3,
      ),
    );
  }
}
