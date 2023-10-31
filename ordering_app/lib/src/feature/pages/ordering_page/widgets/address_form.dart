import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:ordering_app/src/core/models/user.dart';
import 'package:ordering_app/src/feature/app/colors.dart';
import 'package:ordering_app/src/feature/app/sizes.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/add_address_tab.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/select_address_tab.dart';

class AddressForm extends StatelessWidget {
  final String title;
  final String nameInputHintText;
  final String emailInputHintText;
  final String phoneInputHintText;
  final String countryInputHintText;
  final String cityInputHintText;
  final String addressLineInputHintText;
  final String postcodeInputHintText;
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? phoneController;
  final TextEditingController? countryController;
  final TextEditingController? cityController;
  final TextEditingController? addressLineController;
  final TextEditingController? postcodeController;
  final TabController tabController;
  final User? selectedUser;
  final List<User> suggestions;
  final void Function(User) onSuggestionTap;

  const AddressForm({
    super.key,
    required this.title,
    required this.nameInputHintText,
    required this.emailInputHintText,
    required this.phoneInputHintText,
    required this.countryInputHintText,
    required this.cityInputHintText,
    required this.addressLineInputHintText,
    required this.postcodeInputHintText,
    this.nameController,
    this.emailController,
    this.phoneController,
    this.countryController,
    this.cityController,
    this.addressLineController,
    this.postcodeController,
    required this.selectedUser,
    required this.tabController,
    required this.suggestions,
    required this.onSuggestionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormTitle(title: title),
        const SizedBox(height: 16),
        AddressFormTabBar(
          tabController: tabController,
        ),
        const SizedBox(height: 20),
        AutoScaleTabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            AddAddressTab(
              nameInputHintText: nameInputHintText,
              emailInputHintText: emailInputHintText,
              phoneInputHintText: phoneInputHintText,
              countryInputHintText: countryInputHintText,
              cityInputHintText: cityInputHintText,
              addressLineInputHintText: addressLineInputHintText,
              postcodeInputHintText: postcodeInputHintText,
              nameController: nameController,
              emailController: emailController,
              phoneController: phoneController,
              countryController: countryController,
              cityController: cityController,
              addressLineController: addressLineController,
              postcodeController: postcodeController,
            ),
            SelectAddressTab(
              user: selectedUser,
              suggestions: suggestions,
              onSuggestionTap: onSuggestionTap,
            )
          ],
        )
      ],
    );
  }
}

class FormTitle extends StatelessWidget {
  final String title;

  const FormTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.foregroundColor,
      ),
    );
  }
}

class AddressFormTabBar extends StatelessWidget {
  final TabController? tabController;

  const AddressFormTabBar({
    super.key,
    this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: tabController,
        isScrollable: false,
        unselectedLabelColor: AppColors.unselectedTabBarLabelColor,
        labelStyle: const TextStyle(
          color: AppColors.tabBarLabelColor,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        indicator: const BoxDecoration(
          borderRadius: AppSizes.tabBarSelectedLabelBorderRadius,
          color: AppColors.activeElementsColor,
        ),
        tabs: const [
          Tab(
            text: 'Add address',
          ),
          Tab(
            text: 'Select address',
          )
        ]);
  }
}
