import 'package:flutter/material.dart';

void main() => runApp(TelaInicial());


class TelaInicial extends StatelessWidget{
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello catharina App"),
        ),
        body: Container(
            color: Colors.pinkAccent[200],
            child: Center(
                child: Text(
                    "Hello Catharina!!",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    )
                )
            )
        )
    );
  }

}

