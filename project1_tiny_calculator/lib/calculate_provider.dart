import 'package:flutter/material.dart';

class CalculateProvider extends ChangeNotifier {
  List<String> operations = ['+', '/', '-', '*'];
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();
  String result = '';
  int currentIndex = 0;

  String get currentOperation => operations[currentIndex];

  void changeOperator(isUp) {
    currentIndex = (currentIndex + (isUp ? 1 : -1)) % operations.length;
    if (currentIndex < 0) currentIndex += operations.length;

    calculate();
    notifyListeners();
  }

  void calculate() {
    double num1 = double.tryParse(firstNumberController.text) ?? 0;
    double num2 = double.tryParse(secondNumberController.text) ?? 0;

    switch (operations[currentIndex]) {
      case '+':
        result = (num1 + num2).toString();
        break;
    }
    switch (operations[currentIndex]) {
      case '-':
        result = (num1 - num2).toString();

        break;
    }
    switch (operations[currentIndex]) {
      case '*':
        result = (num1 * num2).toString();

        break;
    }
    switch (operations[currentIndex]) {
      case '/':
        result = num2 != 0 ? (num1 / num2).toString() : 'Error';
    }
    notifyListeners();
  }
}
