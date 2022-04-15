import 'package:flutter/material.dart';

class CustomRoundIconButton extends StatelessWidget {
  const CustomRoundIconButton({Key? key, required this.icon, this.onPressed}) : super(key: key);
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: const CircleBorder(),
      child: Icon(icon, size: 40.0, color: Colors.white),
      fillColor: const Color(0xFF4C4F5E),
    );
  }
}
