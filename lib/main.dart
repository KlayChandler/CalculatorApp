import 'package:flutter/material.dart';
import 'calculator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
          filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 63, 63, 63),
        textStyle: const TextStyle(fontSize: 30),
        maximumSize: const Size(200.0, 100.0),
        minimumSize: const Size(60.0, 50.0),
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(5.0),
      ))),
      home: const Calculator(),
    );
  }
}
