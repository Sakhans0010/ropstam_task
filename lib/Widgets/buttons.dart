import 'package:flutter/material.dart';

import '../Constants/colors.dart';

//custom buttons with their specific design or decoration to avoid repetitive code
MaterialButton buildMaterialButton({
  required BuildContext? context,
  Color? color,
  Color? textColor,
  required String? text,
  required Function? onPressed,
  double? width,
  double? height,
}) {
  final screenWidth = MediaQuery.of(context!).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  return MaterialButton(
    onPressed: () => onPressed!(),
    color: color ?? AppColors.kPrimaryColor,
    minWidth: width ?? double.infinity,
    height: height ?? 60,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Text(
      text!,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: textColor ?? AppColors.white,
          ),
    ),
  );
}

TextButton customTextButton({
  required Function? onPressed,
  required String? text,
  Color? color,
}) {
  return TextButton(
    onPressed: () => onPressed!(),
    child: Text(
      text!,
      style: TextStyle(
        color: color ?? Colors.black45,
      ),
    ),
  );
}
