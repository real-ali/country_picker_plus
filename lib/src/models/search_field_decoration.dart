import 'package:flutter/material.dart';

import 'enums/search_icon.dart';

class CPPSFDecoration {
  final SearchIcon searchIconType;
  final IconData? searchIcon;

  final Color? searchIconColor;
  final double? height;
  final TextStyle? hintStyle;

  /// By default value take from Theme Data `bodyMedium`
  final TextStyle? textStyle;
  final Color? curserColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final InputBorder? border;
  final Color? innerColor;
  final InputBorder? focusedBorder;
  final bool? filled;

  const CPPSFDecoration({
    this.searchIcon,
    this.searchIconColor,
    this.filled,
    this.height,
    this.curserColor,
    this.hintStyle,
    this.textStyle,
    this.innerColor,
    this.searchIconType = SearchIcon.start,
    this.padding,
    this.margin,
    this.border,
    this.focusedBorder,
  });

  CPPSFDecoration copyWith(
    IconData? searchIcon,
    SearchIcon? searchIconType,
    Color? searchIconColor,
    TextStyle? hintStyle,
    TextStyle? textStyle,
    double? height,
    Color? innerColor,
    Color? curserColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    InputBorder? border,
    InputBorder? focusedBorder,
    bool? filled,
  ) {
    return CPPSFDecoration(
        searchIcon: searchIcon ?? this.searchIcon,
        hintStyle: hintStyle ?? hintStyle,
        textStyle: textStyle ?? textStyle,
        innerColor: innerColor ?? innerColor,
        searchIconType: searchIconType ?? this.searchIconType,
        curserColor: curserColor ?? this.curserColor,
        padding: padding ?? padding,
        height: height ?? this.height,
        margin: margin ?? margin,
        searchIconColor: searchIconColor ?? this.searchIconColor,
        border: border ?? border,
        focusedBorder: focusedBorder ?? focusedBorder,
        filled: filled ?? this.filled);
  }
}
