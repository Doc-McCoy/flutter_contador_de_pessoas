import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de pessoas",
      home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Variável contadora
  int _people = 0;
  // Texto info
  String _infoText = "Pode Entrar!";

  void _changePeople(int delta) {
    // A função setState faz com que a tela recarregue.
    // Chamar ela sempre que algo no visual do APP precisar ser modificado.
    setState(() {
      // Aumentar / diminuir a variável
      _people += delta;

      if (_people < 0) {
        _infoText = "Mundo Invertido?";
      } else if (_people <= 10) {
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack( // Widget que permite colocar a imagem de fundo e o resto sobre ela

      children: <Widget>[
        Image.asset( // Foi necessário adicionar o caminho do asset no arquivo pubspec.yaml
          "images/restaurant.jpg",
          fit: BoxFit.cover, // Estilo de preenchimento
          height: 1000.0,
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(

                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(1);
                      },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(

                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),

            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            )
          ],
        )
      ],
    );
  }
}
