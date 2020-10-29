import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Card(
        margin: EdgeInsets.only(right: 20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: mainBlock(),
            ),
            secondBlock(),
          ],
        ),
      ),
    );
  }

  Widget mainBlock() {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.credit_card,
                size: 30,
              ),
              SizedBox(width: 10),
              Text(
                'Cartão de crédito',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            'Fatura atual',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blueAccent[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'R\$ 1.500,00',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.blueAccent[700],
            ),
          ),
          Text.rich(
            TextSpan(
                text: 'Limite disponível ',
                children: [
                  TextSpan(
                    text: '3.500,00',
                    style: TextStyle(
                      color: Colors.greenAccent[600],
                    ),
                  ),
                ],
                style: TextStyle(
                  fontSize: 18,
                )),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget secondBlock() {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(30),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.home,
            size: 30,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              'Compra mais recente em X lugar',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
          ),
        ],
      ),
    );
  }
}