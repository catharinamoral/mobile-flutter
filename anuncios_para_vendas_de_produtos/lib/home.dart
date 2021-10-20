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
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Anúncios"),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(0, 173, 215, 1),
    );
  }

  _foto(String nomeFoto) {
    return Image.asset(
      "assets/images/$nomeFoto",
      height: 300,
      width: 300,
      fit: BoxFit.cover,
    );
  }

  _teste(urlFoto, texto) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        //mainAxisAlignment: MainAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          _foto(urlFoto),
          Text(texto, style: TextStyle(fontSize: 22)),
        ],
      ),
    );
  }

  _corpo() {
    return Container(
      child: PageView(
        children: <Widget>[
          _teste('tiktok.jpeg', "Esse é o texto do anúncio 1"),
          _teste('GitHub.jpg', "Esse é o texto do anúncio 2"),
          _teste('facebook.jpg', "Esse é o texto do anúncio 3")
        ],
      ),
    );
  }
}
