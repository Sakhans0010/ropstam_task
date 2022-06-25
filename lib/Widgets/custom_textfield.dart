import 'package:flutter/material.dart';

import '../Constants/colors.dart';

// a custom textfield to make the code  cleaner, non-repetitive (for one widget again and again) and understandable.
Material buildTextFormField({
  required BuildContext? context,
  required InputDecoration? decoration,
  EdgeInsetsGeometry? padding,
  bool? obscureText,
  bool? readOnly,
  String? initialValue,
  TextEditingController? controller,
  FocusNode? focusNode,
  Function? onFieldSubmitted,
  Function? onChanged,
  Function? validator,
  Function? onSaved,
  TextInputType? keyboardType,
  Color? cursorColor,
}) {
  return Material(
    elevation: 5,
    shadowColor: Colors.grey,
    color: AppColors.white,
    borderRadius: BorderRadius.circular(15),
    child: TextFormField(
      style: Theme.of(context!).textTheme.bodyText1,
      obscureText: obscureText ?? false,
      readOnly: readOnly ?? false,
      keyboardType: keyboardType,
      controller: controller,
      focusNode: focusNode,
      cursorColor: AppColors.kPrimaryColor,
      decoration: decoration,
      onFieldSubmitted:
          onFieldSubmitted != null ? (value) => onFieldSubmitted(value) : null,
      onChanged: onChanged != null ? (value) => onChanged(value) : null,
      validator: validator != null ? (value) => validator(value) : null,
      onSaved: onSaved != null ? (value) => onSaved(value) : null,
    ),
  );
}

OutlineInputBorder _outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Colors.white,
      width: 3.0,
    ),
  );
}
