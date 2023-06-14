import 'package:firebase_study/src/features/home/view/home_detail_view.dart';
import 'package:firebase_study/src/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(initialLocation: '/', 
  
  routes: [
    ShellRoute(
      builder: (context, state, child) => Scaffold(body: child,),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeView(),
          routes: [
            GoRoute(
              path: 'detail',
              builder: (context, state) => const HomeDetailView(),
            ),
          ],
        ),
      ],
    ),
  ]);
}
