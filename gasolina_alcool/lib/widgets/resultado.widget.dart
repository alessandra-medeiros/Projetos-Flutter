import 'package:flutter/material.dart';
import 'carregando.widget.dart';

class Resultado extends StatelessWidget {
  var result = '';
  Function reset;

  Resultado({
    @required this.result,
    @required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Carregando(
            ocupado: false,
            funcao: reset,
            invertercor: true,
            texto: 'Calcular novamente',
          ),
        ],
      ),
    );
  }
}
