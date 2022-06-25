import 'package:flutter/material.dart';

import '../Constants/colors.dart';

// a custom dialog so that we don't to create one again and again.
Future<dynamic> customDialog({
  String? content,
  String? title,
  required BuildContext? context,
}) {
  return showDialog(
    context: context!,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(
        title!,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      content: Text(
        content!,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          style: ElevatedButton.styleFrom(
            primary: AppColors.kPrimaryColor,
          ),
          child: const Text('No'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          style: ElevatedButton.styleFrom(
            primary: AppColors.kPrimaryColor,
          ),
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}
