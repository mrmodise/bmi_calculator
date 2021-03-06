import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/shared/components/bottom_button.dart';
import 'package:bmi_calculator/shared/components/constants.dart';
import 'package:bmi_calculator/shared/components/custom_round_icon_botton.dart';
import 'package:bmi_calculator/shared/components/reusable_card.dart';
import 'package:bmi_calculator/shared/components/reusable_card_content.dart';
import 'package:bmi_calculator/shared/utils/calcular_brain.util.dart';
import 'package:flutter/material.dart';

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
  int weight = 60;
  int age = 25;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: [
              Expanded(
                  child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomRoundIconButton(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(() {
                              if (weight > 0) {
                                weight--;
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 10.0),
                        CustomRoundIconButton(
                          icon: Icons.add,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomRoundIconButton(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(() {
                              if (age > 0) {
                                age--;
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 10.0),
                        CustomRoundIconButton(
                          icon: Icons.add,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          )),
          BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calculatorBrain =
                    CalculatorBrain(height, weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calculatorBrain.calculateBMI(),
                              interpretation:
                                  calculatorBrain.getInterpretation(),
                              resultText: calculatorBrain.getResult(),
                            )));
              })
        ],
      ),
    );
  }
}
