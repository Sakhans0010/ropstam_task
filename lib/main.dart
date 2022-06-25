import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ropstam_task/Constants/routes.dart';
import 'package:ropstam_task/Screens/main_screen.dart';

import 'Constants/providers_list.dart';
import 'Themes/app_default_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // To disable the orientation of the app
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      // gets  all the providers from the providers class as I have defined all the providers in a seperated
      providers: ProvidersList.getProviders(),
      child: MaterialApp(
        title: 'Ropstam Task',
        debugShowCheckedModeBanner: false,
        // applies the theme for the app that is defined in a seperate file to make the code look cleaner
        theme: appDefaultTheme(),
        home: const MainScreen(),
        // gets all the routes from the routes class
        routes: Routes.getRoutes(),
      ),
    );
  }
}
