import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/app/colors.dart';
import 'package:ordering_app/src/feature/app/icons.dart';
import 'package:ordering_app/src/feature/app/sizes.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/base_input.dart';

class SelectAddressTab extends StatelessWidget {
  const SelectAddressTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BaseInput(
          hintText: 'Search',
          prefixIcon: Icons.search,
          height: 37,
        ),
        SizedBox(
          height: 12,
        ),
        SelectedAddressBox(),
      ],
    );
  }
}

class SelectedAddressBox extends StatelessWidget {
  const SelectedAddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppColors.selectedAddresBoxBackgroundColor,
        ),
        child: SelectedAddressBoxContent(),
      ),
    );
  }
}

class SelectedAddressBoxContent extends StatelessWidget {
  const SelectedAddressBoxContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.selectedAddresBoxPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danilev Egor',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.selectedAddresBoxPersonLabelColor,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Belarus,Minsk, Derzhinskogo 3b, 80100',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.selectedAddresBoxAddresLabelColor,
                  ),
                )
              ],
            ),
          ),
          Icon(
            AppIcons.create.icon,
            size: AppSizes.selectedAddressBoxIconsSize,
            color: AppColors.selectedAddresBoxIconColor,
          )
        ],
      ),
    );
  }
}
