import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/app/colors.dart';
import 'package:ordering_app/src/feature/app/icons.dart';
import 'package:ordering_app/src/feature/app/sizes.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return const DatePickerBox(
      child: DatePickerContent(),
    );
  }
}

class DatePickerBox extends StatelessWidget {
  final Widget child;

  const DatePickerBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.datePickerHeight,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppSizes.inputBorderRadius,
          border: Border.all(
            color: AppColors.borderColor,
            width: AppSizes.inputBorderWidth,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14172027),
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: AppSizes.datePickerPadding,
          child: child,
        ),
      ),
    );
  }
}

class DatePickerContent extends StatelessWidget {
  const DatePickerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          AppIcons.calendar.icon,
          color: AppColors.iconsColor,
          size: AppSizes.inputLeadingIconSize,
        ),
        const SizedBox(width: 12),
        const Text('Sep 12, 2023',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.foregroundColor,
            ))
      ],
    );
  }
}
