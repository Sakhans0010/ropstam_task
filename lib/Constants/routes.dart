import 'package:flutter/material.dart';
import 'package:ropstam_task/Screens/Home/home_screen.dart';

class Routes {
  //gets all the routes for the app
  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      HomeScreen.routeName: (_) => const HomeScreen(),
    };
  }
}
