import 'package:flutter/material.dart';

interface class PaddingImpl extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;
  const PaddingImpl(
      {required this.child, this.padding = EdgeInsets.zero, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: child);
  }
}

class HorizontalPadding extends PaddingImpl {
  const HorizontalPadding(
      {required Widget child, EdgeInsets padding = EdgeInsets.zero, super.key})
      : super(child: child, padding: padding);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: child,
    );
  }
}

class FullPadding extends PaddingImpl {
  const FullPadding(
      {required Widget child, EdgeInsets padding = EdgeInsets.zero, super.key})
      : super(child: child, padding: padding);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: child,
    );
  }
}
