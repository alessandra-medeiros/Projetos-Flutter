import 'package:flutter/material.dart';

class Carregando extends StatelessWidget {
  var ocupado = false;
  var invertercor = false;
  Function funcao;
  var texto = '';

  Carregando({
    @required this.ocupado,
    @required this.invertercor,
    @required this.funcao,
    @required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return ocupado
        ? Container(
            alignment: Alignment.center,
            height: 40,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            margin: EdgeInsets.all(30),
            width: 500,
            height: 40,
            decoration: BoxDecoration(
              color: invertercor
                  ? Theme.of(context).primaryColor
                  : Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(40),
            ),
            child: FlatButton(
              onPressed: funcao,
              child: Text(
                texto,
                style: TextStyle(
                  color: invertercor
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          );
  }
}
