import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      title: Text("Vagas"),
      centerTitle: true,
      backgroundColor: Colors.red[200],
    );
  }

  _corpo() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            _card("Título 1", "2001", "Essa é a minha descrição", "4002-8922"),
            _card("Título 2", "2002", "Essa é a minha descrição", "4002-8922"),
            _card("Título 3", "2003", "Essa é a minha descrição", "4002-8922"),
            _card("Título 4", "2004", "Essa é a minha descrição", "4002-8922"),
            _card("Título 5", "2005", "Essa é a minha descrição", "4002-8922"),
            _card("Título 6", "2006", "Essa é a minha descrição", "4002-8922"),
            _card("Título 7", "2007", "Essa é a minha descrição", "4002-8922"),
            _card("Título 8", "2008", "Essa é a minha descrição", "4002-8922"),
          ],
        ),
      ),
    );
  }

  _tituloCard(titulo) {
    return Text(
      titulo,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Color.fromRGBO(29, 29, 29, 1),
      ),
    );
  }

  _salarioCard(salario) {
    return Text(
      salario,
      style: TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(0, 154, 13, 1),
      ),
    );
  }

  _descricaoCard(descricao) {
    return Text(
      descricao,
      style: TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
    );
  }

  _contatoCard(contato) {
    return Text(
      contato,
      style: TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
    );
  }

  _card(titulo, salario, descricao, contato) {
    return Container(
      color: Color.fromRGBO(206, 206, 206, .4),
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _tituloCard(titulo),
          _salarioCard("Salário: R\$ $salario"),
          _descricaoCard("Descrição: $descricao"),
          _contatoCard("Contato: $contato")
        ],
      ),
    );
  }
}

// Card
// _titulo
// salario: valor fixo
// descrição xxx
// Contato
