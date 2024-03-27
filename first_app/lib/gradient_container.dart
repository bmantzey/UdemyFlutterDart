import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  // define a constructor function
  const GradientContainer(this.beginColor, this.endColor, {super.key});

  const GradientContainer.purple({super.key})
      : beginColor = Colors.deepPurple,
        endColor = Colors.indigo;

  final Color beginColor;
  final Color endColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [beginColor, endColor],
            begin: beginAlignment,
            end: endAlignment),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
