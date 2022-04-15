import 'package:bmi_calculator/shared/constants.dart';
import 'package:bmi_calculator/shared/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Expanded(
          child: Text(
            'Your result',
            style: kTitleTextStyle,
          ),
        ),
        Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
            ))
      ]),
    );
  }
}
