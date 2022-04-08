import 'package:flutter/material.dart';
import 'input_page.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
        Theme.of(context).colorScheme.copyWith(primary: Color(0xFF090C22)),
        scaffoldBackgroundColor: Color(0xFF090C22)
      ),
      home: InputPage(),
    );
  }
}