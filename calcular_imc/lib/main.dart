import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

  class Home extends StatefulWidget {
    _HomeState createState() => _HomeState();
  }

  class _HomeState extends State<Home> {
    GlobalKey<FormState> _formKey = GlobalKey();
    TextEditingController _pesoController = TextEditingController();
    TextEditingController _alturaController = TextEditingController();
    String _result;

    @override
    void initState() {
      super.initState();
      resetFields();
    }

    void resetFields() {
      _pesoController.text = '';
      _alturaController.text = '';
      setState(() {
        _result = 'Informe seus dados.';
      });
    }
    
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: buildApp(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: buildFormulario(),
        ),
      );
    }

    AppBar buildApp() {
      return AppBar(
        title: Text ('Calcular o IMC'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon (Icons.refresh),
            onPressed: (){
              resetFields();
            }
          )
        ],
      );
    }

    Form buildFormulario() {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildTextFormField(
              label: 'Peso:',
              error: 'Insira seu peso.',
              controller: _pesoController,
            ),
            buildTextFormField(
                label: 'Altura:',
                error: 'Insira sua altura.',
                controller: _alturaController
            ),
            buildTextResult(),
            buildCalculateButton(),
          ]
        ),
      );
    }

    void calculaImc() {
      double peso = double.parse(_pesoController.text);
      double altura = double.parse(_alturaController.text);
      double imc = peso / (altura * altura);
      setState(() {
        _result = 'Seu IMC = ${imc.toStringAsPrecision(2)}\n';
        if (imc < 18.5)
          _result += 'Abaixo do peso.';
        else if (imc >= 18.5 && imc <= 24.9)
          _result += 'Peso ideal.';
        else if (imc >= 25 && imc <= 29.9)
          _result += 'Sobrepeso.';
        else if (imc >= 30 && imc <= 34.9)
          _result += 'Obesidade Grau I.';
        else if (imc >= 35 && imc <= 39.9)
          _result += 'Obesidade Grau II.';
        else
          _result += 'Obesidade Grau III ou Mórbida.';
      });
    }

    Padding buildCalculateButton() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 36),
        child: RaisedButton(
          onPressed: (){
            if(_formKey.currentState.validate()){
              calculaImc();
            }
          },
          child: const Text('Calcular'),
            color: Colors.blue,
            elevation: 4.0,
            textColor: Colors.white,
            splashColor: Colors.blueGrey,
        ),
      );
    }

    Padding buildTextResult() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 36.0),
        child: Text(
          _result,
          textAlign: TextAlign.center
        ),
      );
    }

    TextFormField buildTextFormField ({String label, String error, TextEditingController controller}){
      return TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: label),
        validator: (text){
          return text.isEmpty? error: null;
        },
      );
    }
  }

