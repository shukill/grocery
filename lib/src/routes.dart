import 'package:flutter/material.dart';
import 'package:grocery/src/screens/homescreen.dart';
import 'package:grocery/src/screens/itemList.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/homescreen":
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case "/itemlist":
        return MaterialPageRoute(builder: (context) => ItemList());

      default:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }
}
