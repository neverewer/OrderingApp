import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/app/colors.dart';

class StepDisplayTitle extends StatelessWidget {
  final int step;

  const StepDisplayTitle({
    super.key,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Step ${step.toString()}',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'SF-Pro-Text',
        color: AppColors.foregroundColor,
      ),
    );
  }
}
