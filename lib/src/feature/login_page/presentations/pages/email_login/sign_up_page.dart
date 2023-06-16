import 'package:firebase_study/src/core/layout/default_layout.dart';
import 'package:firebase_study/src/core/resource/validator.dart';
import 'package:firebase_study/src/core/widget/email_text_form.dart';
import 'package:firebase_study/src/core/widget/pass_text_form_field.dart';
import 'package:firebase_study/src/feature/login_page/presentations/widget/email_login/sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class SignUpPage extends ConsumerWidget {
  static String get routeName => 'sign-up';

  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: "Sign Up Page",
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EmailTextForm(
              validator: CustomValidator.basic("Please enter email"),
            ),
            PassTextFormField(
              validator: CustomValidator.basic("Please enter password"),
            ),
            const PassTextFormField(
              isVerify: true,
            ),
            SignUpButton(formKey: _formKey),
          ],
        ),
      ),
    );
  }
}
