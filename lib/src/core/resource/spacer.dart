import 'package:flutter/material.dart';

class CustomSpacer extends StatelessWidget {
  final double height;
  const CustomSpacer({this.height = 8.0, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height,);
  }
}