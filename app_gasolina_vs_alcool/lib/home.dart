import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController alcool = TextEditingController();
  TextEditingController gasolina = TextEditingController();
  String resultado = "Resultado";

  void _alcoolGasolina() {
    setState(() {
      double valueAlcool = double.parse(alcool.text);
      double valueGasolina = double.parse(gasolina.text);

      double divisaoLitro = valueAlcool / valueGasolina;

      if (divisaoLitro <= 0.7) {
        resultado = "O mais vantajoso é o alcool";
      } else {
        resultado = "O mais vantajoso é a gasolina";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Alcool X Gasolina"),
      centerTitle: true,
      backgroundColor: Colors.green[200],
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _campo("Preço do Alcool", alcool),
          _campo("Preço da Gasolina", gasolina),
          _botao(),
          _texto(resultado),
        ],
      ),
    );
  }

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.greenAccent[400])),
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
      controller: objController,
    );
  }

  _botao() {
    return Padding(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Container(
            height: 50.0,
            child: RaisedButton(
              onPressed: _alcoolGasolina,
              child: Text("Verificar",
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
              color: Colors.blueGrey[200],
            )));
  }

  _texto(textoParaExibir) {
    return Text(textoParaExibir,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blueGrey, fontSize: 25.0));
  }

}