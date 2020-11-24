import 'package:as_imdb/screens/app_home_filme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filmes IMDB',
      debugShowCheckedModeBanner: false,
      home: AppHome(),
    );
  }
}
