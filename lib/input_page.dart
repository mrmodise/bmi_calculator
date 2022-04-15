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
  int height = 180;

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: kSliderThumbRadius),
                      overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: kSliderOverlayRadius),
                      thumbColor: kBottomContainerColour,
                      activeTrackColor: kSliderActiveColour,
                      inactiveTrackColor: kSliderInactiveColour,
                      overlayColor: kSliderOverlayColour,
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: kSliderMinValue,
                        max: kSliderMaxValue,
                        onChanged: (double updatedValue) {
                          setState(() {
                            height = updatedValue.round();
                          });
                        }),
                  )
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
