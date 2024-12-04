import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tiny Calculator',
      debugShowCheckedModeBanner: false,
      home: TinyCalculator(),
    );
  }
}

class TinyCalculator extends StatefulWidget {
  const TinyCalculator({super.key});

  @override
  State<TinyCalculator> createState() => _TinyCalculatorState();
}

class _TinyCalculatorState extends State<TinyCalculator> {
  List<String> operations = ['+', '/', '-', '*'];
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _result = '';
  int currentIndex = 0;

  void currentValue(isUp) {
    setState(() {
      currentIndex = (currentIndex + (isUp ? 1 : -1)) % operations.length;
      if (currentIndex < 0) currentIndex += operations.length;
    });
    calculate();
  }

  void calculate() {
    double num1 = double.tryParse(_firstNumberController.text) ?? 0;
    double num2 = double.tryParse(_secondNumberController.text) ?? 0;

    switch (operations[currentIndex]) {
      case '+':
        setState(() {
          _result = (num1 + num2).toString();
        });
        break;
    }
    switch (operations[currentIndex]) {
      case '-':
        setState(() {
          _result = (num1 - num2).toString();
        });
        break;
    }
    switch (operations[currentIndex]) {
      case '*':
        setState(() {
          _result = (num1 * num2).toString();
        });
        break;
    }
    switch (operations[currentIndex]) {
      case '/':
        setState(() {
          _result = num2 != 0 ? (num1 / num2).toString() : 'Error';
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tiny Calculator',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.brown[600],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 140,
                    height: 80,
                    alignment: Alignment.centerRight,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _firstNumberController,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Enter a number',
                          hintStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) => calculate(),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          currentValue(true);
                        },
                        icon: const Icon(Icons.arrow_upward, size: 20),
                      ),
                      Container(
                        width: 80,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Center(
                            child: Text(
                          operations[currentIndex],
                          style: const TextStyle(fontSize: 35),
                        )),
                      ),
                      IconButton(
                        onPressed: () {
                          currentValue(false);
                        },
                        icon: const Icon(Icons.arrow_downward, size: 20),
                      ),
                    ],
                  ),
                  Container(
                    width: 140,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _secondNumberController,
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter a number',
                          hintStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) => calculate(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Container(
              width: 150,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: Center(
                child: Text(
                  'Result : $_result',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
