import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nomeInput = TextEditingController();
  TextEditingController idadeInput = TextEditingController();

  String resultado = "";
  String dropdownValorSexo = 'Masculino';
  String dropdownEscolaridade = "Ensino Fundamental";

  bool valorSwitch = false;
  double valorSlider = 20;

  void _cadastrar() {
    String nome = nomeInput.text;
    double idade = double.parse(idadeInput.text);

    setState(() {
      resultado =
          "Nome: $nome \nIdade: $idade \nSexo: $dropdownValorSexo \nEscolaridade: $dropdownEscolaridade \nLimite: R\$ $valorSlider \nBrasileiro: $valorSwitch";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _corpo(),
    );
  }

  _corpo() {
    return SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _campoText("Nome", nomeInput),
            _campoTextNumber("Idade", idadeInput),
            _dropdownSexo(),
            _dropdownEscolaridade(),
            _slider(),
            _switch(),
            _button("Confirmar"),
            _exibir(resultado),
          ],
        ));
  }

  _exibir(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.left,
      style: TextStyle(color: Color.fromRGBO(134, 5, 184, 1), fontSize: 20.0),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Nubank"),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(134, 5, 184, 1),
    );
  }

  _campoText(label, controller) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Color.fromRGBO(134, 5, 184, 1),
          )),
      style: TextStyle(color: Color.fromRGBO(48, 0, 66, 1), fontSize: 20.0),
      controller: controller,
    );
  }

  _campoTextNumber(label, controller) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Color.fromRGBO(134, 5, 184, 1),
          )),
      style: TextStyle(color: Color.fromRGBO(48, 0, 66, 1), fontSize: 20.0),
      controller: controller,
    );
  }

  _dropdownSexo() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: DropdownButton<String>(
        value: dropdownValorSexo,
        iconSize: 24,
        style: TextStyle(color: Color.fromRGBO(134, 5, 184, 1)),
        underline: Container(
          height: 1,
          color: Color.fromRGBO(134, 5, 184, 1),
        ),
        items: <String>['Masculino', 'Feminino', 'Outros'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? valorSelecionado) {
          setState(() {
            dropdownValorSexo = valorSelecionado!;
          });
        },
      ),
    );
  }

  _dropdownEscolaridade() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: DropdownButton<String>(
        value: dropdownEscolaridade,
        iconSize: 24,
        style: TextStyle(color: Color.fromRGBO(134, 5, 184, 1)),
        underline: Container(
          height: 1,
          color: Color.fromRGBO(134, 5, 184, 1),
        ),
        items: <String>['Ensino Fundamental', 'Ensino Médio', 'Ensino Superior']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? valorSelecionado) {
          setState(() {
            dropdownEscolaridade = valorSelecionado!;
          });
        },
      ),
    );
  }

  _slider() {
    return Row(children: <Widget>[
      Text(
        "Meu limite: ",
        style: TextStyle(color: Color.fromRGBO(134, 5, 184, 1), fontSize: 20.0),
      ),
      Slider(
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
      ),
    ]);
  }

  _switch() {
    return Row(children: <Widget>[
      Text(
        "Brasileiro: ",
        style: TextStyle(color: Color.fromRGBO(134, 5, 184, 1), fontSize: 20.0),
      ),
      Switch(
        value: valorSwitch,
        onChanged: (value) {
          setState(() {
            valorSwitch = value;
          });
        },
        activeTrackColor: Color.fromRGBO(130, 10, 209, .5),
        activeColor: Color.fromRGBO(130, 10, 209, 1),
      )
    ]);
  }

  _button(text) {
    return Padding(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Container(
            height: 50.0,
            width: 500,
            child: RaisedButton(
              onPressed: _cadastrar,
              child: Text("Verificar",
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
              color: Color.fromRGBO(130, 10, 209, 1),
            )));
  }
}
