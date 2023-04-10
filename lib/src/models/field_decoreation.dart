import 'package:flutter/material.dart';

import 'enums/label_position.dart';
import 'enums/pop_up_type.dart';

class CPPFDecoration {
  final double? height;
  final bool showFlag;
  final double? width;
  final String? requiredErrorMessage;

  final IconData? suffixIcon;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;

  /// By default value take from Theme Data `bodyMedium`
  final TextStyle? textStyle;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final InputBorder? border;
  final PopUpType popUpType;

  final bool? isDisable;
  final Color? innerColor;
  final Color? curserColor;
  final LabelPosition labelPosition;
  final Color? suffixColor;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final bool? filled;

  const CPPFDecoration({
    this.curserColor,
    this.requiredErrorMessage,
    this.focusedBorder,
    this.height,
    this.showFlag = true,
    this.filled,
    this.errorBorder,
    this.suffixColor,
    this.suffixIcon,
    this.width,
    this.padding,
    this.margin,
    this.border,
    this.popUpType = PopUpType.bottomSheet,
    this.labelPosition = LabelPosition.top,
    this.isDisable,
    this.innerColor,
    this.labelStyle,
    this.hintStyle,
    this.textStyle,
  });

  CPPFDecoration copyWith({
    double? width,
    bool? showFlag,
    Color? suffixColor,
    String? requiredErrorMessage,
    Color? curserColor,
    IconData? suffixIcon,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    InputBorder? border,
    PopUpType? popUpType,
    bool? isDisable,
    Color? innerColor,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? textStyle,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    bool? filled,
  }) {
    return CPPFDecoration(
      focusedBorder: focusedBorder ?? focusedBorder,
      errorBorder: errorBorder ?? errorBorder,
      width: width ?? this.width,
      padding: padding ?? padding,
      suffixIcon: suffixIcon ?? suffixIcon,
      height: height ?? height,
      margin: margin ?? margin,
      border: border ?? border,
      showFlag: showFlag ?? this.showFlag,
      requiredErrorMessage: requiredErrorMessage ?? this.requiredErrorMessage,
      popUpType: popUpType ?? this.popUpType,
      isDisable: isDisable ?? isDisable,
      innerColor: innerColor ?? innerColor,
      hintStyle: hintStyle ?? hintStyle,
      labelStyle: labelStyle ?? labelStyle,
      filled: filled ?? filled,
      curserColor: curserColor ?? curserColor,
      suffixColor: suffixColor ?? this.suffixColor,
    );
  }
}
