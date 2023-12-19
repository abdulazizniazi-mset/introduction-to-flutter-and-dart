import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_to_flutter_and_dart/util/assignment_one_util.dart';
import 'package:provider/provider.dart';

class Calculator extends StatefulWidget {

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  double _result = 0.0;
  var controllerNum1 = TextEditingController();
  var controllerNum2 = TextEditingController();
  void setCounter(counter) {
    setState(() {
      _result = counter;
    });
  }


  @override
  Widget build(BuildContext context) {
    var calcUtil = Provider.of<CalculatorAssignmentUtil>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

          title: const Text("The Flutter Way - 01"),
        ),
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'The Flutter Way 01- Calculator Assignment',
                      style: TextStyle(fontSize: 22.0),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                        controller: controllerNum1,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter first number',
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ]),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                        controller: controllerNum2,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter second number',
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ]),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: Text("+"),
                          onPressed: () => setState((){
                            _result = calcUtil.addNumbers(double.parse
                            (controllerNum1.text),
                              double.parse(controllerNum2.text));}),
                        ),
                        ElevatedButton(
                          child: Text("-"),
                          onPressed: () => setState((){
                            _result = calcUtil.subtract(double.parse
                            (controllerNum1.text),
                              double.parse(controllerNum2.text));}),
                        ),
                        ElevatedButton(
                          child: Text("x"),
                          onPressed: () => setState((){
                            _result = calcUtil.multiply(double.parse
                            (controllerNum1.text),
                              double.parse(controllerNum2.text));}),
                        ),
                        ElevatedButton(
                          child: Text("/"),
                          onPressed: () => setState((){
                            _result = calcUtil.divide(double.parse
                            (controllerNum1.text),
                              double.parse(controllerNum2.text));}),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      '$_result',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
