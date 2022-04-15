import 'package:bmi_calculator/shared/constants.dart';
import 'package:bmi_calculator/shared/reusable_card.dart';
import 'package:bmi_calculator/shared/reusable_card_content.dart';
import 'package:flutter/material.dart';
import 'package:material_color_gen/material_color_gen.dart';

enum Gender { male, female, other }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;
  Gender selectedGender = Gender.other;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const Color(0xFF0A0E21).toMaterialColor(),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21).toMaterialColor(),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: const ReusableCardContent(
                            icon: Icons.male, label: 'MALE'))),
                Expanded(
                    child: ReusableCard(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: const ReusableCardContent(
                      icon: Icons.female, label: 'FEMALE'),
                ))
              ],
            )),
             Expanded(
                child: ReusableCard(
              colour: kActiveCardColour,
                  cardChild: Column(
                    children: const [
                      Text('HEIGHT')
                    ],
                  ),
            )),
            Expanded(
                child: Row(
              children: const [
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColour,
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColour,
                ))
              ],
            )),
            Container(
              color: kBottomContainerColour,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}
