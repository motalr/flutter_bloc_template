import 'package:flutter/material.dart';

class PageConfig {
  final String name;
  final Widget child;

  const PageConfig({
    required this.name,
    Widget? child,
  }) : child = child ?? const Placeholder();
}
