import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));
const iconSize = 80.0;
const spacing = 18.0;

class ReusableCardContent extends StatelessWidget {
  final String label;
  final IconData icon;

  const ReusableCardContent({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: iconSize),
        const SizedBox(height: spacing),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
