import 'dart:math';

import 'package:calculess/calculess.dart';
import 'package:calculus/calculus.dart';
import 'package:equations/equations.dart';
import 'package:flutter/material.dart';
import 'package:math_parser/integrate.dart';
import 'package:math_parser/math_parser.dart';

class IntegralsScreen extends StatefulWidget {
  const IntegralsScreen({Key? key}) : super(key: key);

  @override
  State<IntegralsScreen> createState() => _IntegralsScreenState();
}

class _IntegralsScreenState extends State<IntegralsScreen> {
  late String functionValue;
  late String upperBoundValue;
  late String lowerBoundValue;
  late String subintervalsValue;

  bool _visibility = false;
  late double resultCalculess = 0;
  late double resultCalculus = 0;
  late double resultEquations = 0;
  late num resultMathParsers = 0;
  late double result = 0;

  final multi = 0.3989422804014327;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Example (Widget Integrals)'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Function:'),
                      initialValue: 'e^((-1*x^2)/2)',
                      onSaved: (value) {
                        functionValue = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Not Null';
                        }
                      },
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Upper bound (to):'),
                      initialValue: '1.88',
                      onSaved: (value) {
                        upperBoundValue = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Not Null';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Lower bound (from):'),
                      initialValue: double.negativeInfinity.toString(),
                      onSaved: (value) {
                        lowerBoundValue = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Not Null';
                        }
                      },
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Subintervals:'),
                      initialValue: '32',
                      onSaved: (value) {
                        subintervalsValue = value!;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            child: const Text('Solve'),
                            onPressed: () {
                              _calculate(context);
                            },
                          ),
                          ElevatedButton(
                            child: const Text('Clean'),
                            onPressed: () {
                              _cancel(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _visibility,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Calculess'),
                      subtitle: Text(resultCalculess.toString()),
                    ),
                    ListTile(
                      title: const Text('Calculus'),
                      subtitle: Text(resultCalculus.toString()),
                    ),
                    ListTile(
                      title: const Text('Equations'),
                      subtitle: Text(resultEquations.toString()),
                    ),
                    ListTile(
                      title: const Text('Math Parsers'),
                      subtitle: Text(resultMathParsers.toString()),
                    ),
                    ListTile(
                      title: const Text('Result'),
                      subtitle: Text(result.toString()),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _calculate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _calculess();
      _calculus();
      _equations();
      _mathParser();
    }
  }

  _cancel(BuildContext context) {
    _formKey.currentState!.reset();
    setState(() {
      resultEquations = 0;
      _visibility = false;
    });
  }

  _calculess() {
    // https://pub.dev/packages/calculess
    exp(x) => pow(e, ((-1 * pow(x, 2)) / 2));
    final results = Calc.integral(double.parse(lowerBoundValue),
        double.parse(upperBoundValue), exp, int.parse(subintervalsValue));

    setState(() {
      resultCalculess = results;
      _visibility = true;
    });
  }

  _calculus() {
    // https://pub.dev/packages/calculus
    exp(x) => pow(e, ((-1 * pow(x, 2)) / 2));
    final results = Calculus.integral(double.parse(lowerBoundValue),
        double.parse(upperBoundValue), exp, int.parse(subintervalsValue));

    setState(() {
      resultCalculus = results;
      _visibility = true;
    });
  }

  _equations() {
    // https://pub.dev/packages/equations
    final simpson = SimpsonRule(
      function: functionValue,
      lowerBound: double.parse(lowerBoundValue),
      upperBound: double.parse(upperBoundValue),
      intervals: int.parse(subintervalsValue),
    );

    final results = simpson.integrate();

    setState(() {
      resultEquations = results.result;
      result = multi * resultEquations * 100;
      _visibility = true;
    });
  }

  _mathParser() {
    // https://pub.dev/packages/math_parser
    final results = MathNodeExpression.fromString(functionValue)
        .definiteIntegralBySimpson(int.parse(subintervalsValue),
            num.parse(lowerBoundValue), num.parse(upperBoundValue));

    setState(() {
      resultMathParsers = results;
      _visibility = true;
    });
  }
}
