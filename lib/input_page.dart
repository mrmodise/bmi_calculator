import 'package:bmi_calculator/shared/reusable_card.dart';
import 'package:bmi_calculator/shared/reusable_card_content.dart';
import 'package:flutter/material.dart';
import 'package:material_color_gen/material_color_gen.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColour = Color(0xFFEB1555);
const activeCardColour = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
              children: const [
                Expanded(
                    child: ReusableCard(
                        colour: activeCardColour,
                        cardChild: ReusableCardContent(
                            icon: Icons.male, label: 'MALE'))),
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: ReusableCardContent(
                      icon: Icons.female, label: 'FEMALE'),
                ))
              ],
            )),
            const Expanded(
                child: ReusableCard(
              colour: activeCardColour,
              cardChild: Icon(Icons.female),
            )),
            Expanded(
                child: Row(
              children: const [
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: Icon(Icons.female),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: Icon(Icons.female),
                ))
              ],
            )),
            Container(
              color: bottomContainerColour,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}
