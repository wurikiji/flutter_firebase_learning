import 'package:firebase_study/src/config/theme/theme.dart';
import 'package:firebase_study/src/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme.get(),
      darkTheme: DarkTheme.get(),
      home: const HomeScreen(),
    );
  }
}
