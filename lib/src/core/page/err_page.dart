import 'package:firebase_study/src/core/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrPage extends StatelessWidget {
  static get routeName => 'err';

  const ErrPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(
          "ErrPage",
          style: bodyLarge?.copyWith(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text(
          _errMsg(context),
          style: bodyMedium?.copyWith(color: Colors.black),
        ),
      ),
    );
  }

  _errMsg(BuildContext context) {
    try {
      final errMsg = GoRouterState.of(context).pathParameters['errMsg'];
      debugPrint("errMsg: $errMsg");
      return errMsg;
    }
     catch(e){

        return "Unknown Error";
      }
  }
}
