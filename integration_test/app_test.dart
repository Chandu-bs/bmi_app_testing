import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_app_testing/main.dart' as app;
import 'package:flutter/material.dart';
import '../util/calculator_class.dart';

void main(){

IntegrationTestWidgetsFlutterBinding.ensureInitialized();

testWidgets(
  "test description",
  (WidgetTester tester) async {
  //Arrange
  app.main();
  await tester.pumpAndSettle();

var _weightDecrementButton =find.byKey(const Key('weight_minus'));
var _ageDecrementButton =find.byKey(const Key('age_minus'));
var _weightIncrementButton =find.byKey(const Key('weight_plus'));
var _ageIncrementButton =find.byKey(const Key('age_plus'));
var _calculateButton =find.byKey(const Key('Calculate'));


  //Act

  await tester.tap(find.byIcon(FontAwesomeIcons.male));
  await tester.pumpAndSettle();
  await Future.delayed(const Duration(seconds: 1));
  await tester.tap(_weightIncrementButton);
  await tester.pumpAndSettle();
  await Future.delayed(const Duration(seconds: 2));
  await tester.tap(_ageIncrementButton);
  await tester.pumpAndSettle();
  await Future.delayed(const Duration(seconds: 2));
  await tester.drag(find.byType(Slider), const Offset(190, 0));
  await tester.pumpAndSettle();
  await Future.delayed(const Duration(seconds: 3));

  

  await tester.tap(_calculateButton);
  await tester.pumpAndSettle();

  await Future.delayed(const Duration(seconds: 3));

  // final _resultValue = '12.01';
  // final _resultText = 'UNDERWEIGHT';
  // final _resultDescription = 'You have a lower value of weight than normal persons, you need to gain more';
  String A = 'You have a lower value of weight than normal persons, you need to gain more';

  //Assert

  // expect(_resultValue, findsOneWidget);
  expect(find.text('UNDERWEIGHT'), findsOneWidget);
  expect(find.text(A), findsOneWidget);
  // expect(_resultDescription, findsOneWidget);

  },
);


}