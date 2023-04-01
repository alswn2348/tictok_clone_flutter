import 'package:flutter/material.dart';

class FlashModeButton extends StatelessWidget {
  final bool checkFlashMode;
  final IconData icon;
  final Function onPressed;

  const FlashModeButton(
      {super.key,
      required this.checkFlashMode,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: checkFlashMode ? Colors.amber.shade200 : Colors.white,
      icon: Icon(icon),
      onPressed: () => onPressed(),
    );
  }
}
