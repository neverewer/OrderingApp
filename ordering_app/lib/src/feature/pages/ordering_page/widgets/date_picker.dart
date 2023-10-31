import 'package:flutter/material.dart';
import 'package:ordering_app/src/core/utils/exteinsions/date_time_extension.dart';
import 'package:ordering_app/src/feature/app/colors.dart';
import 'package:ordering_app/src/feature/app/icons.dart';
import 'package:ordering_app/src/feature/app/sizes.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/ordering_view_model.dart';
import 'package:provider/provider.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final date = context.watch<OrderingViewModel>().orderingDate;
    return DatePickerBox(
      child: DatePickerContent(
        date: date,
      ),
    );
  }
}

class DatePickerBox extends StatelessWidget {
  final Widget child;

  const DatePickerBox({
    super.key,
    required this.child,
  });

  Future<void> pickDate(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );
    if (date == null) {
      return;
    }
    if (context.mounted) {
      context.read<OrderingViewModel>().setOrderingDate(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppSizes.inputBorderRadius,
      onTap: () async {
        await pickDate(context);
      },
      child: SizedBox(
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
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: AppSizes.datePickerPadding,
            child: child,
          ),
        ),
      ),
    );
  }
}

class DatePickerContent extends StatelessWidget {
  final DateTime date;

  const DatePickerContent({
    super.key,
    required this.date,
  });

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
        Text(date.dateToShortString(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.foregroundColor,
            ))
      ],
    );
  }
}
