import 'package:flutter/material.dart';

class BottomSheetStyle {
  final bool isScrollControlled;
  final ShapeBorder? shape;
  final bool useRootNavigator;
  final Color? backgroundColor;

  BottomSheetStyle({
    this.isScrollControlled = false,
    this.shape,
    this.useRootNavigator = false,
    this.backgroundColor,
  });
}
