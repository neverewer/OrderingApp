import 'package:flutter/material.dart';
import 'package:ordering_app/src/feature/pages/ordering_page/ordering_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      home: const Scaffold(
        body: OrderingPage(),
      ),
    );
  }
}
