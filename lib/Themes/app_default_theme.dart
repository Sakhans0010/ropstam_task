import 'package:flutter/material.dart';

import '../Constants/colors.dart';

//default app theme.
ThemeData appDefaultTheme() {
  return ThemeData(
    primaryColor: AppColors.kPrimaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    fontFamily: 'Roboto',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            color: AppColors.kTextColor,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          bodyText2: const TextStyle(
            color: AppColors.kTextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          subtitle1: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kPrimaryColor,
    ),
  );
}
