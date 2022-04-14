import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:material_color_gen/material_color_gen.dart';

const bottomContainerHeight = 80.0;

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
        ).copyWith(
          secondary: Colors.purple,
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
                Expanded(child: ReusableCard(colour: Color(0xFF1D1E33))),
                Expanded(child: ReusableCard(colour: Color(0xFF1D1E33)))
              ],
            )),
            const Expanded(child: ReusableCard(colour: Color(0xFF1D1E33))),
            Expanded(
                child: Row(
              children: const [
                Expanded(child: ReusableCard(colour: Color(0xFF1D1E33))),
                Expanded(child: ReusableCard(colour: Color(0xFF1D1E33)))
              ],
            )),
            Container(
              color: const Color(0xFFEB1555),
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
