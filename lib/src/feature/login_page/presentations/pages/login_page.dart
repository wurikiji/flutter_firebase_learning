import 'package:firebase_study/src/core/layout/default_layout.dart';
import 'package:firebase_study/src/core/resource/padding.dart';
import 'package:firebase_study/src/feature/login_page/presentations/pages/email_login/email_login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  static String get routeName => 'login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: "Login Page",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HorizontalPadding(
              child: emailLoginPageButton(context),
            )
          ],
        ));
  }

  ElevatedButton emailLoginPageButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.goNamed(EmailLoginPage.routeName);
        },
        child: Text(
          "Email Login Page",
          style: Theme.of(context).textTheme.bodyMedium,
        ));
  }
}
