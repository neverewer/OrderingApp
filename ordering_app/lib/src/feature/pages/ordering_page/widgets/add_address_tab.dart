import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/app/colors.dart';
import 'package:ordering_app/src/feature/app/icons.dart';
import 'package:ordering_app/src/feature/app/sizes.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/base_input.dart';

class AddAddressTab extends StatelessWidget {
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? phoneController;
  final TextEditingController? countryController;
  final TextEditingController? cityController;
  final TextEditingController? addressLineController;
  final TextEditingController? postcodeController;

  final String nameInputHintText;
  final String emailInputHintText;
  final String phoneInputHintText;
  final String countryInputHintText;
  final String cityInputHintText;
  final String addressLineInputHintText;
  final String postcodeInputHintText;

  const AddAddressTab({
    super.key,
    this.nameController,
    this.emailController,
    this.phoneController,
    this.countryController,
    this.cityController,
    this.addressLineController,
    this.postcodeController,
    required this.nameInputHintText,
    required this.emailInputHintText,
    required this.phoneInputHintText,
    required this.countryInputHintText,
    required this.cityInputHintText,
    required this.addressLineInputHintText,
    required this.postcodeInputHintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputWithTitle(
          controller: nameController,
          title: 'Full name',
          hintText: nameInputHintText,
          prefixIcon: AppIcons.user.icon,
        ),
        const SizedBox(height: 12),
        InputWithTitle(
          controller: emailController,
          title: 'Email',
          hintText: emailInputHintText,
          prefixIcon: AppIcons.mail.icon,
        ),
        const SizedBox(height: 12),
        InputWithTitle(
          controller: phoneController,
          title: 'Phone number',
          hintText: phoneInputHintText,
          prefixIcon: AppIcons.phone.icon,
        ),
        const SizedBox(height: 16),
        InputWithTitle(
          controller: countryController,
          title: 'Country',
          hintText: countryInputHintText,
          prefixIcon: AppIcons.location.icon,
        ),
        const SizedBox(height: 12),
        InputWithTitle(
          controller: cityController,
          title: 'City',
          hintText: cityInputHintText,
          prefixIcon: AppIcons.city.icon,
        ),
        const SizedBox(height: 12),
        InputWithTitle(
          controller: addressLineController,
          title: 'Address line 1',
          hintText: addressLineInputHintText,
          prefixIcon: AppIcons.pin.icon,
        ),
        const SizedBox(height: 12),
        const AddAddresLineButton(),
        const SizedBox(height: 12),
        InputWithTitle(
          controller: postcodeController,
          title: postcodeInputHintText,
          hintText: 'Postcode',
          prefixIcon: AppIcons.post.icon,
        ),
      ],
    );
  }
}

class InputWithTitle extends StatelessWidget {
  final String title;
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController? controller;

  const InputWithTitle({
    super.key,
    required this.title,
    required this.hintText,
    required this.prefixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title*',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.foregroundColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        BaseInput(
          controller: controller,
          hintText: hintText,
          prefixIcon: prefixIcon,
          height: AppSizes.addAddressTabInputHeight,
        )
      ],
    );
  }
}

class AddAddresLineButton extends StatelessWidget {
  const AddAddresLineButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Text(
        'Add address line +',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.activeElementsColor,
        ),
      ),
    );
  }
}
