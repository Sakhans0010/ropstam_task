import 'package:flutter/material.dart';

import '../Constants/colors.dart';

//a readymade meterial button so that we don't need to create it again and agian.
MaterialButton buildMaterialButton({
  required BuildContext? context,
  Color? color,
  Color? textColor,
  required String? text,
  required Function? onPressed,
  double? width,
  double? height,
}) {
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
      style: Theme.of(context!).textTheme.bodyText1!.copyWith(
            color: textColor ?? AppColors.white,
          ),
    ),
  );
}
