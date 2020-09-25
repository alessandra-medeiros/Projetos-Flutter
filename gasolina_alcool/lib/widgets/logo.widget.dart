import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
          SizedBox(
            height: 70,
          ),
          Container(
            child: Image.asset(
            'assets/imgs/logo.png',
            height: 100,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Álcool X Gasolina',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
      ],
    );
  }
}