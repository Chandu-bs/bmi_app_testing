import 'dart:ffi';

import 'package:bmi_app_testing/calculator_brain.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/calculator_class.dart';


 void main() {
  
test("Checking BMI value from the calculator", (){



//setup

Calculator bmi = Calculator(height: 170, weight: 55);

//do

bmi.calculateBMI();

//test
expect(bmi.calculateBMI(), '19.03');

});



test("Checking BMI report from the calculator", (){

//setup

Calculator value = Calculator(height: 184, weight: 55);

//do
String report = value.getResult();


//test
expect(report, 'UnderWeight');

});


test("Checking BMI description from the calculator", (){

//setup
String A = 'You have more weight than normal people, So try to exercise more';
String B = 'You are perfect, Good job and stay fit!';
String C = 'You have a lower value of weight than normal persons, you need to gain more';

Calculator value = Calculator(height: 181, weight: 75);


//do
String opinion = value.getInterpretation();


//test
expect(opinion, B);

});

}
