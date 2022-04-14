import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;

  const ReusableCard({Key? key, required this.colour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
