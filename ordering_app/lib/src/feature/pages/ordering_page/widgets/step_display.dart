import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/app/colors.dart';

class StepDisplay extends StatelessWidget {
  const StepDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Step 1',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'SF-Pro-Text',
        color: AppColors.foregroundColor,
      ),
    );
  }
}
