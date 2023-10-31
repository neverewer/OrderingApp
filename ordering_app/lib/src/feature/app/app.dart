import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/ordering_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: OrderingPage(),
      ),
    );
  }
}
