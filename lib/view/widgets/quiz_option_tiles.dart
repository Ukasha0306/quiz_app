import 'package:flutter/material.dart';
import '../../utils/color.dart';

class TQuizOptionTiles extends StatelessWidget {
  final String option;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isCorrect;
  const TQuizOptionTiles(
      {super.key,


      required this.option,
      this.isSelected = false,
      required this.onTap,
      required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.grey.shade200;
    if (isSelected) {
        backgroundColor = greenColor;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            option,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
