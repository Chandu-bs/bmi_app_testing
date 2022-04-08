import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final VoidCallback onPress;
  ReusableCard({required this.colour, required this.cardChild, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return BottomButton(onPress: onPress, cardChild: cardChild, colour: colour);
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
  
    required this.onPress,
    required this.cardChild,
    required this.colour,
  }) ;

  final VoidCallback onPress;
  final Widget cardChild;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}