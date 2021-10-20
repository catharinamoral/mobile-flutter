import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valorController = TextEditingController();
  String dropdownValor = 'Real';
  String dropdownValor2 = 'Dólar';
  String resultado = "";

  //Euro = 6,22
  //Dolar = 5,37
  void _calcular() {
    setState(() {
      double valor = double.parse(valorController.text);
      String teste = 'Dólar Real Euro';

      // REAL 1
      if (dropdownValor == "Real" && dropdownValor2 == "Real") {
        resultado = "$valor reais";
      }
      if (dropdownValor == "Real" && dropdownValor2 == "Dólar") {
        double resultadoTotal = (valor / 5.37);
        resultado = "$resultadoTotal de Dólares";
      }

      if (dropdownValor == "Real" && dropdownValor2 == "Euro") {
        double resultadoTotal = (valor / 6.22);
        resultado = "$resultadoTotal euros";
      }

      //Dólar 1
      if (dropdownValor == "Dólar" && dropdownValor2 == "Real") {
        double resultadoTotal = (valor * 5.37);
        resultado = "$resultadoTotal Reais";

        print("cheguei");
      }
      if (dropdownValor == "Dólar" && dropdownValor2 == "Dólar") {
        resultado = "$valor Dólares";
      }

      if (dropdownValor == "Dólar" && dropdownValor2 == "Euro") {
        double resultadoTotal = (valor * 0.86);
        resultado = "$resultadoTotal Euros";
      }

      //EURO 1

      if (dropdownValor == "Euro" && dropdownValor2 == "Real") {
        double resultadoTotal = (valor * 6.22);
        resultado = "$resultadoTotal dólares";
      }
      if (dropdownValor == "Euro" && dropdownValor2 == "Dólar") {
        double resultadoTotal = (valor * 1.16);
        resultado = "$resultadoTotal dólares";
      }

      if (dropdownValor == "Euro" && dropdownValor2 == "Euro") {
        resultado = "$valor Euros";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _body(),
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      color: Colors.white10,
      margin: const EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _campo(),
          _dropdown(),
          _dropdown2(),
          _botao(),
          Text(
            resultado,
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Conversor de Moedas, Dólar, Real e Euro"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _campo() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Valor", labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: valorController,
    );
  }

  _dropdown() {
    return DropdownButton<String>(
      value: dropdownValor,
      items: <String>['Dólar', 'Real', 'Euro'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          dropdownValor = valorSelecionado!;
        });
      },
    );
  }

  _dropdown2() {
    return DropdownButton<String>(
      value: dropdownValor2,
      items: <String>['Dólar', 'Real', 'Euro'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          dropdownValor2 = valorSelecionado!;
        });
      },
    );
  }

  _botao() {
    return RaisedButton(
      color: Colors.blue,
      onPressed: _calcular,
      child: Text(
        "Converter",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
