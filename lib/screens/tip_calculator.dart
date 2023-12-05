import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_to_flutter_and_dart/util/tip_calculator_util.dart';
import 'package:provider/provider.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double _sliderValue = 0;
  double tip = 0;
  double bill = 0;
  TextEditingController controllerBill = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var tipCalculator = Provider.of<TipCalculatorUtil>(context);
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tip Calculator"),
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
                      'The Flutter Way 02- Tip Calculator',
                      style: TextStyle(fontSize: 22.0),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                      controller: controllerBill,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter bill amount',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) =>
                      {
                        setState(() {
                          tip = tipCalculator.calculateTip(value, _sliderValue);
                        }),
                        setState(() {
                          bill = tipCalculator.calculateBill(value, tip);
                        })
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const Text('Select Tip Percentage:'),
                    Slider(
                        min: 0,
                        max: 30,
                        divisions: 10,
                        label: "${_sliderValue.round()}%",
                        value: _sliderValue,
                        onChanged: (double mValue) =>
                        {
                          setState(() {
                            _sliderValue = mValue;
                          }),
                          tip = tipCalculator.calculateTip(controllerBill.text, mValue),
                          bill = tipCalculator.calculateBill(controllerBill.text, tip)
                        }),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Tip Amount: PKR $tip",
                    ),
                    Text("Bill Amount: PKR $bill")
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
