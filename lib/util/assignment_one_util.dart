import 'package:flutter/material.dart';

class CalculatorAssignmentUtil extends ChangeNotifier{

  double addNumbers(double num1, double num2) =>   num1 + num2;

  double subtract(double num1, double num2) => num1 - num2;

  double multiply(double num1, double num2) => num1 * num2;

  double divide(double num1, double num2) =>  num1 / num2;

}