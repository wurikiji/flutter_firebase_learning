import 'package:firebase_study/src/core/layout/default_layout.dart';
import 'package:firebase_study/src/core/resource/padding.dart';
import 'package:firebase_study/src/core/resource/spacer.dart';
import 'package:firebase_study/src/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static String get routeName => 'sign-up';
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: "Sign Up Page",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HorizontalPadding(
              child: CustomTextFormField(title: "Email", onTap: () {}),
            ),
            const CustomSpacer(),
            HorizontalPadding(
              child: CustomTextFormField(title: "Password", onTap: () {}),
            ),
            const CustomSpacer(),
            HorizontalPadding(
              child:
                  CustomTextFormField(title: "Verify Password", onTap: () {}),
            ),
            const CustomSpacer(),
            HorizontalPadding(
              child: _signUpButton(context),
            ),
          ],
        ));
  }

  ElevatedButton _signUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "Sign Up",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
      ),
    );
  }
}
