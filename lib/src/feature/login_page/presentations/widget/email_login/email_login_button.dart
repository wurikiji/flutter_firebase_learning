import 'package:firebase_study/src/core/resource/padding.dart';
import 'package:flutter/material.dart';

class EmailLoginButton extends StatelessWidget {
  const EmailLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FullPadding(
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          "Login",
        ),
      ),
    );
  }
}
