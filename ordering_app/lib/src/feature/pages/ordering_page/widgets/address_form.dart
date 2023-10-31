import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/app/colors.dart';
import 'package:ordering_app/src/feature/app/sizes.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/add_address_tab.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/select_address_tab.dart';

class AdressForm extends StatefulWidget {
  final String title;

  const AdressForm({
    super.key,
    required this.title,
  });

  @override
  State<AdressForm> createState() => _AddAdressFormState();
}

class _AddAdressFormState extends State<AdressForm> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
      animationDuration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormTitle(title: widget.title),
        const SizedBox(height: 16),
        AddressFormTabBar(
          tabController: _tabController,
        ),
        const SizedBox(height: 20),
        AutoScaleTabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: const [AddAddressTab(), SelectAddressTab()],
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
