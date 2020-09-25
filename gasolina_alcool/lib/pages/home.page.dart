import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:gasolina_alcool/widgets/enviar-form.widget.dart';
import 'package:gasolina_alcool/widgets/logo.widget.dart';
import 'package:gasolina_alcool/widgets/resultado.widget.dart';
import 'package:gasolina_alcool/widgets/input.widget.dart';
import 'package:gasolina_alcool/widgets/carregando.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _cor = Colors.green;
  var _gasolinaController = new MoneyMaskedTextController();
  var _alcoolController = new MoneyMaskedTextController();
  var _ocupado = false;
  var _completo = false;
  var _resultTexto = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: Duration(
            milliseconds: 1200,
          ),
          color: _cor,
          child: ListView(
            children: <Widget>[
              Logo(),
              _completo
                  ? Resultado(
                      result: _resultTexto,
                      reset: reset,
                    )
                  : EnviarForm(
                      alcoolController: _alcoolController,
                      gasolinaController: _gasolinaController,
                      ocupado: _ocupado,
                      enviarFuncao: calcular,
                    ),
            ],
          ),
        ));
  }

  Future calcular() {
    double alcool = double.parse(
            _alcoolController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double gasolina = double.parse(
            _gasolinaController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double resultadoconta = alcool / gasolina;

    setState(() {
      _cor = Colors.lightGreen[200];
      _completo = false;
      _ocupado = true;
    });

    return new Future.delayed(
      const Duration(seconds: 1),
      () => {
        setState(() {
          if (resultadoconta >= 0.7) {
            _resultTexto = 'Compensa usar gasolina!';
          } else {
            _resultTexto = 'Compensa usar álcool!';
          }

          _ocupado = false;
          _completo = true;
        }),
      },
    );
  }

  reset() {
    setState(() {
      _cor = Colors.green;
      _alcoolController = new MoneyMaskedTextController();
      _gasolinaController = new MoneyMaskedTextController();
      _completo = false;
      _ocupado = false;
    });
  }
}
