import 'package:app_11_formulario_de_abertura_de_conta_bancaria_com_2_telas/dados.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();

  String dropdownValor1 = 'Masculino';
  String dropdownValor2 = 'Fundamental';
  double valorSlider = 1000;
  bool valorSwitch = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _body(context),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Abertura de conta"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  _body(context) {
    return Container(
      width: double.infinity,
      color: Colors.white10,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _campo(),
          _campoIdade(),
          _exibirCampo("Sexo: ", _dropdown()),
          _exibirCampo("Escolaridade: ", _dropdownEnsino()),
          _exibirCampo("Limite: ", _slider()),
          _exibirCampo("Brasileiro: ", _switch()),
          _button(context)
        ],
      ),
    );
  }

  _exibirCampo(text, elemento) {
    return Row(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
        elemento
      ],
    );
  }

  _campo() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: "Digite o seu nome",
          labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 16.0),
      controller: nomeController,
    );
  }

  _campoIdade() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Digite o sua idade",
          labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 16.0),
      controller: idadeController,
    );
  }

  _dropdown() {
    return DropdownButton<String>(
      value: dropdownValor1,
      items: <String>['Masculino', 'Feminino', 'Outro'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          dropdownValor1 = valorSelecionado!;
        });
      },
    );
  }

  _dropdownEnsino() {
    return DropdownButton<String>(
      value: dropdownValor2,
      items: <String>['Fundamental', 'Médio', 'Graduação'].map((String value) {
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

  _slider() {
    return Slider(
      value: valorSlider,
      min: 0,
      max: 5000,
      divisions: 100,
      label: valorSlider.round().toString(),
      onChanged: (double value) {
        setState(() {
          valorSlider = value;
        });
      },
    );
  }

  _switch() {
    return Switch(
      value: valorSwitch,
      onChanged: (value) {
        setState(() {
          valorSwitch = value;
        });
      },
      activeTrackColor: Colors.blue[200],
      activeColor: Colors.blue,
    );
  }

  _button(BuildContext context) {
    return RaisedButton(
      color: Colors.blue[400],
      //onPressed: null,
      onPressed: () {
        _onClickNavegacao(context);
      },

      child: Text(
        "Confirmar",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  _onClickNavegacao(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Dados(
              valueNome: nomeController,
              idadeController: idadeController,
              dropdownValor1: dropdownValor1,
              dropdownValor2: dropdownValor2,
              valorSlider: valorSlider,
              valorSwitch: valorSwitch);
        },
      ),
    );
  }
}
