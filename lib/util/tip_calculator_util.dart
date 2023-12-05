import 'package:flutter/material.dart';

class TipCalculatorUtil extends ChangeNotifier{

  double calculateTip(String textValue, double sliderValue){
    return double.parse(textValue) * (sliderValue / 100);
  }

  double calculateBill(String textValue, double tip){
    return double.parse(textValue) + tip;
  }
}