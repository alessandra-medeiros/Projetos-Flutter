import 'package:flutter/material.dart';

class PersonIdentification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/imgs/logo.png',
          width: 70,
          color: Colors.white,
        ),
        Text(
          'Alessandra',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
