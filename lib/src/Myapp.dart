import 'package:flutter/material.dart';
import 'package:grocery/src/screens/homescreen.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListGet',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.materialRoutes,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: HomeScreen(),
    );
  }
}