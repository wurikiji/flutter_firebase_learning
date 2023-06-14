import 'package:firebase_study/src/core/layout/default_layout.dart';
import 'package:firebase_study/src/core/resource/padding.dart';
import 'package:firebase_study/src/core/resource/spacer.dart';
import 'package:firebase_study/src/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPassPage extends StatelessWidget {
  static String get routeName => 'forget-pass';
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double customSpaceHeight = MediaQuery.of(context).size.height / 4;
    return DefaultLayout(
      title: "",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomSpacer(height: customSpaceHeight),
          const HorizontalPadding(
            child: Text(
                "If you enter the registered email, we will send you a password reset email."),
          ),
          HorizontalPadding(
            child: CustomTextFormField(
              title: "Email",
              onTap: () {},
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Send",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          CustomSpacer(height: customSpaceHeight),
        ],
      ),
    );
  }
}
