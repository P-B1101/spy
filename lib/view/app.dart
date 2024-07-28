import 'package:flutter/material.dart';
import 'package:spy/view/home_page.dart';
import 'package:spy/view/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light('IranYekanX'),
      home: const HomePage(),
    );
  }
}
