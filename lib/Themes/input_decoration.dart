import 'package:flutter/material.dart';

import '../Constants/colors.dart';

/// constant or may be changed --text field decoration to aoid repetitive code.
InputDecoration inputDecoration({
  required BuildContext? context,
  String? helper,
  String? hint,
  String? error,
  String? label,
  Color? labelColor = AppColors.kTextColor,
  TextStyle? labelStyle,
  TextStyle? hintStyle,
  Widget? suffix,
  Widget? suffixIcon,
  Widget? prefixIcon,
  bool? filled,
  Color? fillColor,
  InputBorder? border,
  InputBorder? enabledBorder,
  InputBorder? focusedBorder,
  EdgeInsetsGeometry? contentPadding,
}) {
  return InputDecoration(
    // hintText: 'Email Address',

    hintText: hint,
    hintStyle: hintStyle ??
        const TextStyle(
          color: Colors.grey,
        ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 20,
    ),
    errorText: error,
    labelText: label,

    labelStyle: labelStyle ?? Theme.of(context!).textTheme.bodyText1,
    suffix: suffix,
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,

    filled: filled,
    fillColor: fillColor ?? Colors.grey.withOpacity(0.2),

    // border: InputBorder.none,
    border: border ?? _outlineInputBorder(),
    errorBorder: _outlineInputBorder(),
    enabledBorder: enabledBorder ?? _outlineInputBorder(),
    focusedBorder: focusedBorder ?? _outlineInputBorder(),
  );
}

OutlineInputBorder _outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: Colors.white,
    ),
  );
}
