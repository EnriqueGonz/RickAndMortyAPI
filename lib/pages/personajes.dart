import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Personajes extends StatefulWidget{
  final int id;
  var url2;
  Personajes(this.id,this.url2);
  @override
  _PersonajesState createState() => new _PersonajesState();
}

class _PersonajesState extends State<Personajes> {
  var data;
  var id;

  Future<String> getRMData() async {
    var res = await http
        .get(Uri.encodeFull(widget.url2), headers: {"Accept": "application/json"});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody;
      print(widget.url2);

    });
    return "Success!";
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(data["id"].toString()),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              child: Text(data["name"],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w200,fontSize: 40.0),
              ),
            ),
            Card(
              child: Image.network(
                data["image"],
              ),
            ),
            Card(
              child: Text("Estatus: "+data["status"],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20.0),
              ),
            ),
            Card(
              child: Text("Especie: "+data["species"],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20.0),
              ),
            ),
            Card(
              child: Text("Genero: "+data["gender"],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20.0),
              ),
            ),
            Card(
              child: Text("Origen: "+data["origin"]["name"],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20.0),
              ),
            )
          ],
        ),
      )
    );
  }
  @override
  void initState() {
    this.getRMData();
    super.initState();
  }

}