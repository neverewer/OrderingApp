import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/app/sizes.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/adress_form.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/date_picker.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/next_step_button.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/step_display.dart';

class OrderingView extends StatefulWidget {
  const OrderingView({super.key});

  @override
  State<OrderingView> createState() => _OrderingViewState();
}

class _OrderingViewState extends State<OrderingView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
              padding: AppSizes.orderingPageContentPadding,
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: const IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StepDisplay(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Start date',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF172027),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      DatePicker(),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: AdressForm(
                          title: 'Sender details',
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: AdressForm(
                          title: 'Recipient details',
                        ),
                      ),
                      SizedBox(height: 20),
                      NextStepButton(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class OrderingContent extends StatelessWidget {
  const OrderingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
      StepDisplay(),
      Text(
        'Start date',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF172027),
        ),
      ),
      SizedBox(height: 8),
      DatePicker(),
      SizedBox(
        height: 40,
      ),
      SizedBox(
        width: double.infinity,
        child: AdressForm(
          title: 'Sender details',
        ),
      ),
      SizedBox(
        height: 16,
      ),
      SizedBox(
        width: double.infinity,
        child: AdressForm(
          title: 'Recipient details',
        ),
      ),
    ]);
  }
}
