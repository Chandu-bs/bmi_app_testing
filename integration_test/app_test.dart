import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_app_testing/main.dart' as app;
import 'package:flutter/material.dart';

void main(){

IntegrationTestWidgetsFlutterBinding.ensureInitialized();

group('Performing bmi app test', (){

var _weightDecrementButton =find.byKey(const Key('weight_minus'));
var _ageDecrementButton =find.byKey(const Key('age_minus'));
var _weightIncrementButton =find.byKey(const Key('weight_plus'));
var _ageIncrementButton =find.byKey(const Key('age_plus'));
var _calculateButton =find.byKey(const Key('Calculate'));

testWidgets(
  "test description",
  (WidgetTester tester) async {
  app.main();
  await tester.pumpAndSettle();
  //Arrange
  await tester.tap(_weightIncrementButton);
  await tester.pumpAndSettle();
  await tester.tap(_ageIncrementButton);
  await tester.pumpAndSettle();
  await tester.tap(_calculateButton);
  await tester.pumpAndSettle();

  },
);


});

}