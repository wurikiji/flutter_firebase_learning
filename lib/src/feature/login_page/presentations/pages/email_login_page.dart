import 'package:firebase_study/src/core/layout/default_layout.dart';
import 'package:firebase_study/src/core/resource/padding.dart';
import 'package:firebase_study/src/core/resource/spacer.dart';
import 'package:firebase_study/src/core/widget/custom_text_form_field.dart';
import 'package:firebase_study/src/feature/login_page/presentations/pages/forget_pass_page.dart';
import 'package:firebase_study/src/feature/login_page/presentations/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmailLoginPage extends StatelessWidget {
  static String get routeName => 'email-login';

  const EmailLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "Email Login Page",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HorizontalPadding(
            child: _emailFormField(),
          ),
          const CustomSpacer(),
          HorizontalPadding(
            child: _passwordFormField(),
          ),
          const CustomSpacer(),
          HorizontalPadding(
            child: _loginButton(),
          ),
          const CustomSpacer(),
          HorizontalPadding(
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

  CustomTextFormField _emailFormField() => CustomTextFormField(
        onTap: () {},
        title: "Email",
      );

  CustomTextFormField _passwordFormField() => CustomTextFormField(
        title: "Password",
        onTap: () {},
        isPassword: true,
      );

  ElevatedButton _loginButton() => ElevatedButton(
        onPressed: () {},
        child: const Text(
          "Login",
        ),
      );
}
