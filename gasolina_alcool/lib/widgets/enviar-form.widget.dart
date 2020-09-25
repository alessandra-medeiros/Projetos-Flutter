import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'input.widget.dart';
import 'carregando.widget.dart';

class EnviarForm extends StatelessWidget {
  var gasolinaController = new MoneyMaskedTextController();
  var alcoolController = new MoneyMaskedTextController();
  var ocupado = false;
  Function enviarFuncao;

  EnviarForm({
    @required this.gasolinaController,
    @required this.alcoolController,
    @required this.ocupado,
    @required this.enviarFuncao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget> [
          Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30
            ),
            child: Input(
              label: 'Gasolina',
              control: gasolinaController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30
            ),
            child: Input(
              label: 'Álcool',
              control: alcoolController,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Carregando(
              ocupado: ocupado,
              funcao: enviarFuncao,
              invertercor: false,
              texto: 'Calcular',
            ),
        ],
      )
    );
  }
}
