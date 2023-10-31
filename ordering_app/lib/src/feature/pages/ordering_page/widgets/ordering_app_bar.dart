import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/app/colors.dart';
import 'package:ordering_app/src/feature/app/icons.dart';
import 'package:ordering_app/src/feature/app/sizes.dart';

class OrderingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OrderingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.backgroundColor,
      centerTitle: true,
      leading: Icon(
        AppIcons.arrowBack.icon,
        color: AppColors.foregroundColor,
      ),
      title: const Text(
        'Ordering',
        style: TextStyle(
          color: AppColors.foregroundColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appBarHeight);
}
