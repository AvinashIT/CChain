import 'package:flutter/material.dart';

class Questions with ChangeNotifier {
  final List<String> _recQuestions = [
  "What is the total volume of materials recycled?",
  "What is the total energy consumption?",
  "What is the water consumption for recycling activities?",

];

final List<String> _manuQuestions = [
  "What is the total energy consumption?",
  "What is the total water consumption?",
  "what is the amount of fossils used?",
];

final List<String> _travelQuestions = [
  "What is the number of means of transport",
  "What is the total distance traveled?",
  "What is the fuel consumption per kilometer?",
  "What is the type of fuel utilized?",
];


  List get recQuestions {
    return _recQuestions;
  }

  List get travelQuestions {
    return _travelQuestions;
  }

  List get manuQuestions {
    return _manuQuestions;
  }
}
