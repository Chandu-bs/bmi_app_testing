import 'dart:math';
class CalculatorBrain {
  final int height;
  final int weight;

  CalculatorBrain({required this.height, required this.weight,});

  
  double _bmi = 0.0;

  String calculateBMI() {
   
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  
  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18) {
      return 'Normal';
    } else{
      return 'UnderWeight';
    }
  }

  String getInterpretation(){
    if (_bmi >= 25) {
      return 'You have more weight than normal people, So try to exercise more';
    } else if (_bmi > 18) {
      return 'You are perfect, Good job and stay fit!';
    } else{
      return 'You have a lower value of weight than normal persons, you need to gain more';
    }
  }
}