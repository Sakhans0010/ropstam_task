import 'package:flutter/material.dart';
import 'package:ropstam_task/Constants/colors.dart';
import 'package:ropstam_task/Screens/Auth%20Screen/components/login_form.dart';

import '../../Widgets/spacers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // gesture detector to unfocus a textfield when tapped outside
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // for background gradient color I have added a container
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                AppColors.white,
                AppColors.aeroBlue,
              ],
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Hello Again!',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 30,
                    ),
              ),
              //vertical spacer or Horizontal spacer is sizedboxed widget with height and width.
              //just fo simplification.
              verticalSpacer(10),
              Text(
                'Chance to get your life better',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 20,
                    ),
              ),
              verticalSpacer(40),
              // In Login form widget all the login stuff is managed.
              // have seperated it just to make the code the cleaner
              const LoginForm(),
              verticalSpacer(40),
            ],
          ),
        ),
      ),
    );
  }
}
