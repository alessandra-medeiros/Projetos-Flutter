import 'package:flutter/material.dart';
import 'package:layout_aula/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}