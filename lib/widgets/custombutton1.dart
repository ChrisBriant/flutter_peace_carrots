import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  final Function onPressed;
  final String label;

  const CustomButton1({
    required this.onPressed,
    required this.label,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(), 
      style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87, // Transparent button background
            foregroundColor: Colors.white, // White text color
            side: const BorderSide(color: Colors.white, width: 4), // White border
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Spacious padding
            elevation: 0, // No shadow for a flat, modern look
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 20
        ),
      )
    );
  }
}