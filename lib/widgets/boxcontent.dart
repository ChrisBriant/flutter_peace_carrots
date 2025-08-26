//This is a container to display content on the screen
import 'package:flutter/material.dart';

class BoxContent extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Color borderColor;

  const BoxContent({
    required this.child,
    required this.backgroundColor,
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
      child: child,
    );
  }
}