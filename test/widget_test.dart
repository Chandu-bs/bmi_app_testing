import 'package:bmi_app_testing/constants.dart';
import 'package:bmi_app_testing/icon_content.dart';
import 'package:bmi_app_testing/input_page.dart';
import 'package:bmi_app_testing/main.dart';
import 'package:bmi_app_testing/reusable_card.dart';
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

  expect(find.text('FEMALE'), findsOneWidget);
  

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
testWidgets(
   "check the weight increment function",
   (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: InputPage()));

  var _weightIncrementButton =find.byKey(const Key('weight_plus'));

  await tester.tap(_weightIncrementButton);
  await tester.pump();

  var _text1 = find.text('51');
  expect(_text1, findsOneWidget);

   },
 );

testWidgets(
   "check the slider widget",
   (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: InputPage()));
  
  await tester.drag(find.byType(Slider), const Offset(120, 0));
  await tester.pumpAndSettle();

  expect(find.byKey(const Key('SliderKey')), findsOneWidget);
  

   },
 );

testWidgets(
   "check the slider widget function",
   (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: InputPage()));
  
  await tester.drag(find.byType(Slider), const Offset(120, 0));
  await tester.pumpAndSettle();

  expect(find.byKey(const Key('SliderKey')), findsOneWidget);

  var slider = find.byKey(const Key('SliderCard'));
  await tester.tap(slider);
  await tester.pump();
  
  expect(find.text('165'), findsOneWidget);
  

   },
 );

}