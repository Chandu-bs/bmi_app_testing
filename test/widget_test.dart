import 'package:bmi_app_testing/input_page.dart';
import 'package:bmi_app_testing/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  
testWidgets(
  "Male icon and text",
  (WidgetTester tester) async {

await tester.pumpWidget(MaterialApp(home: InputPage()));

await tester.tap(find.byIcon(FontAwesomeIcons.male));
await tester.pump();
 
expect(find.text('MALE'), findsOneWidget);


  },
);
 
 testWidgets(
   "Female icon and text",
   (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: InputPage()));

  await tester.tap(find.byIcon(FontAwesomeIcons.female));
  await tester.pump();

  expect(find.text('FEMALe'), findsNothing);

   },
 );

testWidgets(
   "check the weight decrement function",
   (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: InputPage()));

  var _weightDecrementButton =find.byKey(const Key('weight_minus'));

  await tester.tap(_weightDecrementButton);
  await tester.pump();

  var _text = find.text('49');
  expect(_text, findsOneWidget);

   },
 );


}