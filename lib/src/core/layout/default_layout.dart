import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final String title;
  const DefaultLayout({required this.title, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap(context),
      child: Scaffold(
        appBar: _appBar(context: context),
        body: child,
      ),
    );
  }

  void Function() _onTap(BuildContext context) {
    return () {
      FocusScope.of(context).unfocus();
    };
  }

  AppBar _appBar({required BuildContext context}) {
    return AppBar(
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
