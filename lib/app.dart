import 'package:firebase_study/src/config/route/router.dart';
import 'package:firebase_study/src/config/theme/theme.dart';
import 'package:firebase_study/src/feature/firebase_auth/services/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    ref.watch(authRepositoryProvider).authStateChanges().listen((event) {
      debugPrint("[!]Auth Change : $event");
    });

    return MaterialApp.router(
      theme: LightTheme.get(),
      darkTheme: DarkTheme.get(),
      routerConfig: router
    );
  }
}
