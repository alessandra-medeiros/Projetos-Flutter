import 'package:flutter/material.dart';
import 'package:interface_nubank/pages/home_page.dart';
import 'package:interface_nubank/themes/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interface Nubank',
      theme: ThemeData(
        primaryColor: NPrimaryCollor,
        accentColor: NPrimaryCollor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
