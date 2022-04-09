import 'package:bmi_app_testing/reusable_card.dart';
import 'reusable_card.dart';
import 'package:bmi_app_testing/calculator_brain.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.interpretation, required this.bmiResult, required this.resultText});

  final String bmiResult;
  final String interpretation;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      'Your Result!',
                      style: kTitleTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(flex: 5,
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(resultText.toUpperCase(), style: kResultTextStyle,),
                        Text(bmiResult, style: kBmiTextStyle,),
                        Text(interpretation, textAlign: TextAlign.center,
                        style: kBmiResultText,)
                      ],
                    ), onPress: (){}, key: const Key('value'),
                  )
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                    child: Center(child: Text('RE-CALCULATE', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900, color: Colors.white),)),
                    color: kBottomcontainercolor,
                    margin: EdgeInsets.only(top: 15.0),
                    width: double.infinity,
                    height: kBottomcontainerheight
                ),
              )
            ],
          )
    );
  }
}
