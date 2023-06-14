import 'package:firebase_study/src/feature/login_page/presentations/pages/email_login_page.dart';
import 'package:firebase_study/src/feature/login_page/presentations/pages/forget_pass_page.dart';
import 'package:firebase_study/src/feature/login_page/presentations/pages/login_page.dart';
import 'package:firebase_study/src/feature/login_page/presentations/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => Scaffold(
          body: child,
        ),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const LoginPage(),
            routes: [
              GoRoute(
                  path: EmailLoginPage.routeName,
                  name: EmailLoginPage.routeName,
                  builder: (context, state) => const EmailLoginPage(),
                  routes: [
                    GoRoute(
                      path: SignUpPage.routeName,
                      name: SignUpPage.routeName,
                      builder: (context, state) => const SignUpPage(),
                    ),
                    GoRoute(
                      path: ForgetPassPage.routeName,
                      name: ForgetPassPage.routeName,
                      builder: (context, state) => const ForgetPassPage(),
                    ),
                  ]),
            ],
          ),
        ],
      ),
    ],
  );
}
