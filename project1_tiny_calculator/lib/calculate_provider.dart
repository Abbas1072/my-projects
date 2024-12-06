import 'package:flutter/material.dart';

class CalculateProvider extends ChangeNotifier {
  final List<String> _operations = ['+', '/', '-', '*'];
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();
  String result = '';
  int _currentIndex = 0;

  String get currentOperation => _operations[_currentIndex];

  void changeOperator(isUp) {
    _currentIndex = (_currentIndex + (isUp ? 1 : -1)) % _operations.length;
    if (_currentIndex < 0) _currentIndex += _operations.length;
    calculate();
  }

  void numberProvider() {
    firstNumberController.addListener(calculate);
    secondNumberController.addListener(calculate);
  }

  void calculate() {
    double num1 = double.tryParse(firstNumberController.text) ?? 0;
    double num2 = double.tryParse(secondNumberController.text) ?? 0;

    switch (_operations[_currentIndex]) {
      case '+':
        result = (num1 + num2).toString();
        break;

      case '-':
        result = (num1 - num2).toString();

        break;

      case '*':
        result = (num1 * num2).toString();

        break;

      case '/':
        result = num2 != 0 ? (num1 / num2).toString() : 'Error';
    }
    notifyListeners();
  }

  @override
  void dispose() {
    firstNumberController.dispose();
    secondNumberController.dispose();
    super.dispose();
  }
}
