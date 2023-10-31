import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/ordering_view.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/ordering_app_bar.dart';

class OrderingPage extends StatelessWidget {
  const OrderingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: OrderingAppBar(),
      body: OrderingView(),
    );
  }
}
