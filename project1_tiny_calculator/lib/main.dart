import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculate_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculateProvider()),
      ],
      child: const MaterialApp(
        title: 'Tiny Calculator',
        debugShowCheckedModeBanner: false,
        home: TinyCalculator(),
      ),
    );
  }
}

class TinyCalculator extends StatelessWidget {
  const TinyCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculateProvider>(context);
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
                        controller: provider.firstNumberController,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Enter a number',
                          hintStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          provider.changeOperator(true);
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
                            provider.currentOperation,
                            style: const TextStyle(fontSize: 35),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          provider.changeOperator(false);
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
                        controller: provider.secondNumberController,
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Enter a number',
                          hintStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                        ),
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
                  provider.result,
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
