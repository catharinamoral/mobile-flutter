import 'package:app_12_meu_perfil_com_drawer_navigation/pages/Experiencia.dart';
import 'package:app_12_meu_perfil_com_drawer_navigation/pages/Formacao.dart';
import 'package:app_12_meu_perfil_com_drawer_navigation/pages/Pessoal.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _body(),
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            _infoPessoal(
                "https://pm1.narvii.com/6787/f0a3f3a448551a8b684481c34216e275ac371322v2_hq.jpg",
                "Catharina"),
            ListTile(
              title: Text('Pessoal'),
              subtitle: Text('Tela Pessoal'),
              trailing: Icon(Icons.people),
              onTap: () {
                setState(() {
                  _currentPage = 2;
                });
              },
            ),
            ListTile(
              title: Text('Formação'),
              subtitle: Text('Tela Formação'),
              trailing: Icon(Icons.book),
              onTap: () {
                setState(() {
                  _currentPage = 3;
                });
              },
            ),
            ListTile(
              title: Text('Experiência'),
              subtitle: Text('Tela Experiência'),
              trailing: Icon(Icons.contact_mail_rounded),
              onTap: () {
                setState(() {
                  _currentPage = 4;
                });
              },
            ),
          ],
        )),
      ),
    );
  }

  _infoPessoal(url, nome) {
    return Column(children: <Widget>[
      _foto(url),
      Text(nome),
    ]);
  }

  _foto(url) {
    return Center(
      child: Image.network(
        url,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("App Drawer Navigation"),
      centerTitle: true,
      backgroundColor: Colors.purple[200],
    );
  }

  _body() {
    if (_currentPage == 1) {
      return Center(child: Text('Tela Home'));
    } else if (_currentPage == 2) {
      return Pessoal();
    } else if (_currentPage == 3) {
      return Formacao();
    } else {
      return Experiencia();
    }
  }
}
