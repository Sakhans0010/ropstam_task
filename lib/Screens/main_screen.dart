import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ropstam_task/Screens/Auth%20Screen/login_screen.dart';
import 'package:ropstam_task/Screens/Home/home_screen.dart';
import 'package:ropstam_task/Services/auth_services.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthServices>(
      // checks whether the user is authenticated
      builder: (ctx, auth, _) => auth.isAuth
          ? const HomeScreen()
          : FutureBuilder(
              // tries to auto login
              future: auth.tryAutoLogIn(),
              builder: (ctx, authResultSnapshot) {
                // the tryAutoLogin method checks the user session and returns true or false it returns true that means that the user can be auto logged in.
                // if the method returns false it means the user session has been killed or there was no user session so the user will have to log in.
                if (authResultSnapshot.data == null) {
                  // just a dummy splash
                  return const SplashScreen();
                } else if ((authResultSnapshot.data!)) {
                  // main home screen where the data is loaded
                  return const HomeScreen();
                } else {
                  // login screen to log the user in if the user session has been killed
                  return const LoginScreen();
                }
              },
            ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash',
        ),
      ),
    );
  }
}
