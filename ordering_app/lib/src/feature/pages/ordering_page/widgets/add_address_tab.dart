import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/app/colors.dart';
import 'package:ordering_app/src/feature/app/icons.dart';
import 'package:ordering_app/src/feature/app/sizes.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/base_input.dart';

class AddAddressTab extends StatelessWidget {
  const AddAddressTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputWithTitle(
          title: 'Full name',
          hintText: 'Daniel Egor',
          prefixIcon: AppIcons.user.icon,
        ),
        const SizedBox(height: 12),
        InputWithTitle(
          title: 'Email',
          hintText: 'egor_zu@email.com',
          prefixIcon: AppIcons.mail.icon,
        ),
        const SizedBox(height: 12),
        InputWithTitle(
          title: 'Phone number',
          hintText: '+375726014690',
          prefixIcon: AppIcons.phone.icon,
        ),
        const SizedBox(height: 16),
        InputWithTitle(
          title: 'Country',
          hintText: 'Belarus',
          prefixIcon: AppIcons.location.icon,
        ),
        const SizedBox(height: 12),
        InputWithTitle(
          title: 'City',
          hintText: 'Minsk',
          prefixIcon: AppIcons.city.icon,
        ),
        const SizedBox(height: 12),
        InputWithTitle(
          title: 'Address line 1',
          hintText: 'Derzhinskogo 3b',
          prefixIcon: AppIcons.pin.icon,
        ),
        const SizedBox(height: 12),
        const AddAddresLineButton(),
        const SizedBox(height: 12),
        InputWithTitle(
          title: 'Postcode',
          hintText: '220069',
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

  const InputWithTitle({
    super.key,
    required this.title,
    required this.hintText,
    required this.prefixIcon,
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
