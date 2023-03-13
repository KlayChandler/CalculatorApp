import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final List<String> _input = [];
  String _result = "";

  double _memory = 0.0;

  void _addToInput(String value) {
    setState(() {
      _input.add(value);
      _result = "";
    });
  }

  void _deleteLastInput() {
    setState(() {
      if (_input.isNotEmpty) {
        _input.removeLast();
      }
      _result = "";
    });
  }

  void _calculateResult() {
    String inputString = _input.join();
    Parser p = Parser();
    Expression exp = p.parse(inputString);

    ContextModel cm = ContextModel();
    double evalResult = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _result = evalResult.toString();
      _input.clear();
      _input.add(evalResult.toString());
    });
  }

  void _memoryStore() {
    setState(() {
      if (_result.isEmpty) {
        _memory = double.parse(_input.join());
      } else {
        _memory = double.parse(_result);
      }
    });
  }

  void _memoryRecall() {
    setState(() {
      _input.add(_memory.toString());
      _result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scaffold(
            backgroundColor: Colors.black87,
            body: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    _input.join(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      onPressed: _memoryRecall,
                      style: FilledButton.styleFrom(
                        foregroundColor: Colors.black87,
                        backgroundColor:
                            const Color.fromARGB(255, 141, 141, 141),
                        textStyle: TextStyle(fontSize: 23),
                      ),
                      child: const Text('M'),
                    ),
                    FilledButton(
                      onPressed: _memoryStore,
                      style: FilledButton.styleFrom(
                        foregroundColor: Colors.black87,
                        backgroundColor:
                            const Color.fromARGB(255, 141, 141, 141),
                        textStyle: TextStyle(fontSize: 23),
                      ),
                      child: const Text('M+'),
                    ),
                    FilledButton(
                      onPressed: _deleteLastInput,
                      style: FilledButton.styleFrom(
                        foregroundColor: Colors.black87,
                        backgroundColor:
                            const Color.fromARGB(255, 141, 141, 141),
                        textStyle: TextStyle(fontSize: 23),
                      ),
                      child: const Text('Del'),
                    ),
                    FilledButton(
                      onPressed: () => _addToInput('/'),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: const Text('÷'),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      onPressed: () => _addToInput('7'),
                      child: const Text('7'),
                    ),
                    FilledButton(
                      onPressed: () => _addToInput('8'),
                      child: const Text('8'),
                    ),
                    FilledButton(
                      onPressed: () => _addToInput('9'),
                      child: const Text('9'),
                    ),
                    FilledButton(
                      onPressed: () => _addToInput('*'),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: const Text('×'),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      onPressed: () => _addToInput('4'),
                      child: const Text('4'),
                    ),
                    FilledButton(
                      onPressed: () => _addToInput('5'),
                      child: const Text('5'),
                    ),
                    FilledButton(
                      onPressed: () => _addToInput('6'),
                      child: const Text('6'),
                    ),
                    FilledButton(
                      onPressed: () => _addToInput('-'),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: const Text('-'),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      onPressed: () => _addToInput('1'),
                      child: const Text('1'),
                    ),
                    FilledButton(
                      onPressed: () => _addToInput('2'),
                      child: const Text('2'),
                    ),
                    FilledButton(
                      onPressed: () => _addToInput('3'),
                      child: const Text('3'),
                    ),
                    FilledButton(
                      onPressed: () => _addToInput('+'),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: const Text('+'),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                        onPressed: () => _addToInput('0'),
                        style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0)),
                            minimumSize: const Size(100.0, 50.0),
                            maximumSize: const Size(100.0, 50.0)),
                        child: const Text('0')),
                    const Padding(padding: EdgeInsets.all(0.0)),
                    FilledButton(
                      onPressed: () => _addToInput('.'),
                      child: const Text('.'),
                    ),
                    FilledButton.tonal(
                      onPressed: _calculateResult,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: const Text('='),
                    ),
                  ],
                ),
              ],
            )));
  }
}
