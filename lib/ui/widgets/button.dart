import 'package:flutter/material.dart';
import 'package:panda/ui/theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const MyButton({
    this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 18,
        ),
        decoration: BoxDecoration(
          color: primaryClr,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: white,
            ),
          ),
        ),
      ),
    );
  }
}
