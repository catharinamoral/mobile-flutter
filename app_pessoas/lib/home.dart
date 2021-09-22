import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
 
  String infoResultado = "0 PESSOAS";
  double valor = 0;
 
  void _addUm() {
    setState(() {
      valor = valor + 1;
      infoResultado = '$valor PESSOAS';
    });
  }

  void _tiraUm() {
    setState(() {
      valor = valor - 1;
      infoResultado = '$valor PESSOAS';
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("Contador de pessoas"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }
 
  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _botaoMaisUm(),
          _botaoMenosUm(),
          _texto(infoResultado),
        ],
      ),
    );
  }
  _botaoMaisUm() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _addUm,
          child: Text("+1",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.blue,
        ),
      ),
    );
  }

  _botaoMenosUm() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _tiraUm,
          child: Text("-1",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.blue,
        ),
      ),
    );
  }
 
  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 25.0),
    );
  }
}
