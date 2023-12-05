import 'dart:async';

import 'package:flutter/material.dart';
import 'package:introduction_to_flutter_and_dart/data/styles.dart';
import 'package:introduction_to_flutter_and_dart/screens/assignment_list.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Scaffold(
        body: Splash(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    ),
  );
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Timer(
        Duration(seconds: 1),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => AssignmentList())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/mse_technology_logo.jpeg"),
          const Text(
            "The Flutter Way",
            style: TextStyles.title,
          )
        ],
      ),
    );
  }
}
