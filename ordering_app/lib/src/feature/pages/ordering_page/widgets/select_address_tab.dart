import 'package:flutter/material.dart';
import 'package:ordering_app/src/core/models/user.dart';
import 'package:ordering_app/src/feature/app/colors.dart';
import 'package:ordering_app/src/feature/app/icons.dart';
import 'package:ordering_app/src/feature/app/sizes.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/search_input.dart';


class SelectAddressTab extends StatelessWidget {
  final User? user;
  final List<User> suggestions;
  final void Function(User) onSuggestionTap;

  const SelectAddressTab({
    super.key,
    required this.user,
    required this.suggestions,
    required this.onSuggestionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchInput(
          suggestions: suggestions,
          onSuggestionTap: onSuggestionTap,
        ),
        const SizedBox(height: 12),
        user != null ? SelectedAddressBox(user: user!) : const SizedBox(),
      ],
    );
  }
}

class SelectedAddressBox extends StatelessWidget {
  final User user;

  const SelectedAddressBox({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.selecteAddresBoxHeight,
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppColors.selectedAddresBoxBackgroundColor,
        ),
        child: SelectedAddressBoxContent(
          user: user,
        ),
      ),
    );
  }
}

class SelectedAddressBoxContent extends StatelessWidget {
  final User user;

  const SelectedAddressBoxContent({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.selectedAddresBoxPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.selectedAddresBoxPersonLabelColor,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  user.getFullAddress(),
                  style: const TextStyle(
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

