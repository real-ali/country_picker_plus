import 'package:flutter/material.dart';

/// Bottom sheet style
class BottomSheetStyle {
  final bool isScrollControlled;
  final ShapeBorder? shape;
  final bool useRootNavigator;
  final Color? backgroundColor;

  /// Bottom sheet style Constractor
  BottomSheetStyle({
    this.isScrollControlled = false,
    this.shape,
    this.useRootNavigator = false,
    this.backgroundColor,
  });
}
