import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/ordering_view.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/ordering_view_model.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/widgets/ordering_app_bar.dart';
import 'package:provider/provider.dart';

class OrderingPage extends StatelessWidget {
  const OrderingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => OrderingViewModel(),
        child: const Scaffold(
          appBar: OrderingAppBar(),
          body: OrderingView(),
        ));
  }
}
