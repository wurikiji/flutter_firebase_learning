import 'package:firebase_study/src/core/layout/default_layout.dart';
import 'package:firebase_study/src/core/resource/padding.dart';
import 'package:firebase_study/src/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPassPage extends StatelessWidget {
  static String get routeName => 'forget-pass';
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const FullPadding(
            child: Text(
                "If you enter the registered email, we will send you a password reset email."),
          ),
          FullPadding(
            child: CustomTextFormField(
              title: "Email",
              onTap: () {},
            ),
          ),
          FullPadding(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Send",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
