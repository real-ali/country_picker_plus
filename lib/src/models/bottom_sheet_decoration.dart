import 'package:flutter/material.dart';

import 'enums/close_icon.dart';

class CPPBSHDecoration {
  final TextStyle? itemTextStyle;
  final EdgeInsetsGeometry? itemsPadding;
  final CloseIcon closeIcon;
  final BoxDecoration? itemDecoration;
  final ShapeBorder? shape;
  final double? height;
  final EdgeInsetsGeometry? itemsSpace;
  final Color? closeColor;
  final Color? islandColor;
  final double? islandWidth;

  const CPPBSHDecoration({
    this.closeColor,
    this.shape,
    this.height,
    this.itemTextStyle,
    this.itemsSpace,
    this.itemsPadding,
    this.closeIcon = CloseIcon.outside,
    this.itemDecoration,
    this.islandColor,
    this.islandWidth,
  });

  CPPBSHDecoration copyWith(
    TextStyle? itemTextStyle,
    EdgeInsetsGeometry? itemsPadding,
    EdgeInsetsGeometry? itemsSpace,
    CloseIcon? closeIcon,
    Color? closeColor,
    BoxDecoration? itemDecoration,
    double? height,
    ShapeBorder? shape,
    Color? islandColor,
    double? islandWidth,
  ) {
    return CPPBSHDecoration(
      itemTextStyle: itemTextStyle ?? this.itemTextStyle,
      itemsPadding: itemsPadding ?? this.itemsPadding,
      height: height ?? height,
      itemsSpace: itemsSpace ?? this.itemsSpace,
      closeColor: closeColor ?? this.closeColor,
      shape: shape ?? this.shape,
      closeIcon: closeIcon ?? this.closeIcon,
      itemDecoration: itemDecoration ?? itemDecoration,
      islandColor: islandColor ?? this.islandColor,
      islandWidth: islandWidth ?? this.islandWidth,
    );
  }
}
