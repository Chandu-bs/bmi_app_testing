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

  var _text = find.text('54');
  expect(_text, findsOneWidget);

   },
 );

 testWidgets(
   "check the age decrement function",
   (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: InputPage()));

  var _ageDecrementButton =find.byKey(const Key('age_minus'));

  await tester.tap(_ageDecrementButton);
  await tester.pump();

  var _text = find.text('24');
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

  var _text1 = find.text('56');
  expect(_text1, findsOneWidget);

   },
 );

 testWidgets(
   "check the age increment function",
   (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: InputPage()));

  var _ageIncrementButton =find.byKey(const Key('age_plus'));

  await tester.tap(_ageIncrementButton);
  await tester.pump();

  var _text2 = find.text('26');
  expect(_text2, findsOneWidget);

   },
 );

testWidgets(
   "check the slider widget",
   (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: InputPage()));
  
  await tester.drag(find.byType(Slider), const Offset(190, 0));
  await tester.pumpAndSettle();

  expect(find.byKey(const Key('SliderKey')), findsOneWidget);
  

   },
 );


testWidgets(
  "Checking the calculate button",
  (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: InputPage()));

  var _calculateButton =find.byKey(const Key('Calculate'));
  await tester.tap(_calculateButton);
  await tester.pump();

  var _text3 = find.text('CALCULATE');
  expect(_text3, findsOneWidget);

  },
);


testWidgets(
   "check the height card",
   (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: InputPage()));
  
  await tester.drag(find.byType(Slider), const Offset(190, 0));
  await tester.pumpAndSettle();

  // expect(find.byKey(const Key('SliderKey')), findsOneWidget);

  find.byKey(const Key('SliderText'));
  
  expect(find.text('HEIGHT'), findsOneWidget);


   },
 );

testWidgets(
   "check the slider value by checking functionality",
   (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: InputPage()));
  
  await tester.drag(find.byType(Slider), const Offset(190, 0));
  await tester.pumpAndSettle();

  // expect(find.byKey(const Key('SliderKey')), findsOneWidget);

  

  
  expect(find.byKey(const Key('SliderText')), inExclusiveRange(120, 260).toString());


   },
 );


}

