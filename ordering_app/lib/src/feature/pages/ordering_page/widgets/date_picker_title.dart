import 'package:flutter/material.dart';

class DatePickerTitle extends StatelessWidget {
  const DatePickerTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Start date',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF172027),
        ),
      ),
    );
  }
}
