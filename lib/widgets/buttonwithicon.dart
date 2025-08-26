import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final bool waiting;
  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Icon icon;
  final Function onTap;

  const ButtonWithIcon({
    required this.waiting,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.label,
    required this.icon,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: waiting ?  null : () => onTap() ,
      child: Container(
        height: 60,
        width: double.infinity,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
          border: BoxBorder.all(
            color: borderColor,
            width: 4
          )
        ),
        child: waiting
        ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: textColor,),
            const SizedBox(width: 10,),
            Text(
              'Loading...',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            )
          ],
        )
        : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10,),
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            )
          ],
        )
      ),
    );
  }
}