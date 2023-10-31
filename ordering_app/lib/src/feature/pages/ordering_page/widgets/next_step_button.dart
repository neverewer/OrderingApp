import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/app/colors.dart';
import 'package:ordering_app/src/feature/app/sizes.dart';

class NextStepButton extends StatelessWidget {
  final Function()? onPressed;

  const NextStepButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.nextStepButtonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.activeElementsColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: AppSizes.nextStepButtonBorderRadius,
            ),
          ),
        ),
        child: const Text(
          'Next step',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
