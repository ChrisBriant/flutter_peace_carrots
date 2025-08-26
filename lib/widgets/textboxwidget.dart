import 'package:flutter/material.dart';

class TextBoxWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double size;
  final Color borderColor;

  const TextBoxWidget({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.size,
    required this.borderColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: BoxBorder.all(
          color: borderColor,
          width: 1
        )
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: size
        ),
      ),
    );
  }
}