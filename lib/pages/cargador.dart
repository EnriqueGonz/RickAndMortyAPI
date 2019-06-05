import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import './personajes.dart';



class Cargador extends StatefulWidget {
  final String url2;
  Cargador(this.url2);
  @override
  _CargadorState createState() => new _CargadorState();

}

class _CargadorState extends State<Cargador> {
  @override
  Widget build(BuildContext context) {
    print(Offset(0.0, -1.0).distanceSquared - Offset(0.0, 0.0).distanceSquared);
    return new Scaffold(

      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),

      body: new Center(
        child: FlatButton(onPressed: () async {
          await new Future.delayed(const Duration(seconds: 1));
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Personajes(widget.url2)),
          ); //Navigator
        },
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Image.asset('assets/loading.gif',
                  scale: 0.8,
                ),
              ),
              Card(
                child: JumpingText('Loading...'),
              )

            ],
          ),
        ),
        ),
      );

  }
}