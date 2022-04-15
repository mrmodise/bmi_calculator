import 'package:flutter/material.dart';
import 'constants.dart';

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
        Icon(icon, size: kIconSize),
        const SizedBox(height: kSpacing),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
