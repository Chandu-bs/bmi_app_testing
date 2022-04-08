import 'calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';


enum Gender{male,female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  
  Gender selectedGender = Gender.male;
  int height = 150;
  int weight = 50;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child:
          Row(
            children: [
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender= Gender.male;
                  });
                },
                colour: selectedGender== Gender.male? kActiveCardColor:kInactiveCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.male, label:'MALE'),)
              ),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender= Gender.female;
                  });
                },
                colour: selectedGender== Gender.female? kActiveCardColor:kInactiveCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.female, label: 'FEMALE',),)
              ),
            ],
          ),
          ),
          Expanded(child: ReusableCard(colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT', style: kLabelTextStyle,) ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(height.toString(), style: kNumberStyle,),
                    Text('cm', style: kLabelTextStyle,),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15)
                  ),
                  child: Slider(value: height.toDouble(),
                    min: 120,
                    max: 260,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue){
                    setState(() {
                      height= newValue.round();
                    });
                      },
                  ),
                )
              ],
            ), onPress: (){},
          )
          ),
          Expanded(child:
          Row(
            children: [
              Expanded(child: ReusableCard(colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WEIGHT', style: kLabelTextStyle,),
                    Text(weight.toString(), style: kNumberStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(width: 20,),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                        )
                          ],

                    )
                  ],
                ), onPress: (){}
              )
              ),
              Expanded(child: ReusableCard(colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AGE', style: kLabelTextStyle,),
                    Text(age.toString(), style: kNumberStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(width: 20,),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                        )
                      ],

                    )
                  ],
                ), onPress: () {  }, 
              )
              ),
            ],
          ),
          ),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context)=>
              ResultsPage(
                bmiResult: calc.calculateBMI(),
                interpretation: calc.getInterpretation(),
                resultText: calc.getResult(),
              )
              ));
            },
            child: Container(
              child: Center(child: Text('CALCULATE', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900, color: Colors.white),)),
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

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, color: Colors.white,),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
    );
  }
}



