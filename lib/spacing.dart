// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

class VerticalSpacing {
  final double height;
  Widget widget = const SizedBox();
  VerticalSpacing(this.height) {
    widget = SizedBox(height: height);
  }

  static Widget custom(double height) {
    final spacing = VerticalSpacing(height);
    return spacing.widget;
  }

  static Widget XS() => VerticalSpacing(10).widget;
  static Widget S() => VerticalSpacing(16).widget;
  static Widget M() => VerticalSpacing(20).widget;
  static Widget L() => VerticalSpacing(40).widget;
  static Widget XL() => VerticalSpacing(100).widget;
  static Widget XXL() => VerticalSpacing(120).widget;
}

class HorizontalSpacing {
  final double width;
  Widget widget = const SizedBox();
  HorizontalSpacing(this.width) {
    widget = SizedBox(width: width);
  }

  static Widget custom(double width) {
    final spacing = HorizontalSpacing(width);
    return spacing.widget;
  }

  static Widget XS() => HorizontalSpacing(3).widget;
  static Widget S() => HorizontalSpacing(5).widget;
  static Widget M() => HorizontalSpacing(10).widget;
  static Widget L() => HorizontalSpacing(16).widget;
  static Widget XL() => HorizontalSpacing(24).widget;
  static Widget XXL() => HorizontalSpacing(40).widget;
}