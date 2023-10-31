import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/app/colors.dart';
import 'package:ordering_app/src/feature/app/sizes.dart';

class BaseInput extends StatelessWidget {
  final double height;
  final String hintText;
  final IconData prefixIcon;

  const BaseInput({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: AppSizes.inputBorderRadius,
            borderSide: BorderSide(
              width: AppSizes.inputBorderWidth,
              color: AppColors.borderColor,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.inputHintTextColor,
          ),
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(prefixIcon),
          prefixIconColor: AppColors.iconsColor,
        ),
      ),
    );
  }
}
