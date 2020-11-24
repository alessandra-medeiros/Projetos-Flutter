import 'package:flutter/material.dart';

class TextoFilme extends StatelessWidget {
  final String text;

  TextoFilme(this.text);

  @override
  Widget build(BuildContext contex) {
    return Padding(
        child: Text(this.text), 
        padding: EdgeInsets.only(top: 5, bottom: 5));
  }
}