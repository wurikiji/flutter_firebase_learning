import 'package:firebase_study/src/core/layout/default_layout.dart';
import 'package:firebase_study/src/core/resource/padding.dart';
import 'package:firebase_study/src/core/resource/validator.dart';
import 'package:firebase_study/src/core/widget/custom_text_form_field.dart';
import 'package:firebase_study/src/core/widget/email_text_form.dart';
import 'package:firebase_study/src/core/widget/pass_text_form_field.dart';
import 'package:firebase_study/src/feature/login_page/presentations/pages/email_login/forget_pass_page.dart';
import 'package:firebase_study/src/feature/login_page/presentations/pages/email_login/sign_up_page.dart';
import 'package:firebase_study/src/feature/login_page/presentations/widget/email_login/email_login_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class EmailLoginPage extends StatelessWidget {
  static String get routeName => 'email-login';

  const EmailLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "Email Login Page",
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FullPadding(
              child: EmailTextForm(
                  validator: CustomValidator.basic("Please enter email"),),
            ),
            FullPadding(
              child: PassTextFormField(
                validator: CustomValidator.basic("Please enter password"),
              ),
            ),
            const FullPadding(
              child: EmailLoginButton(),
            ),
            FullPadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _forgetPasswordButton(context),
                  _signUpButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton _signUpButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.goNamed(SignUpPage.routeName);
      },
      child: const Text("Sign Up"),
    );
  }

  TextButton _forgetPasswordButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.goNamed(ForgetPassPage.routeName);
      },
      child: const Text("Forgot Password?"),
    );
  }

  CustomTextFormField emailFormField() => CustomTextFormField(
        onTap: () {},
        title: "Email",
      );

  CustomTextFormField passwordFormField() => CustomTextFormField(
        title: "Password",
        onTap: () {},
        isPassword: true,
      );

}
