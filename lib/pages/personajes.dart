import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './welcome.dart';
import './cargador.dart';


class Personajes extends StatefulWidget{
  var url2;
  Personajes(this.url2);
  @override
  _PersonajesState createState() => new _PersonajesState();
}

class _PersonajesState extends State<Personajes> {
  var data;
  bool load =false;


  Future<String> getRMData() async {
    var res = await http
        .get(Uri.encodeFull(widget.url2), headers: {"Accept": "application/json"});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody;
      print(widget.url2);

    });
    load = true;
    return "Success!";
  }

  @override
  Widget build(BuildContext context){
    return load == true ?
      Scaffold(
      appBar: AppBar(
        title: Text('                                     '+data["id"].toString()),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
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
            ),
            Card(
              child: Text("-",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20.0),
              ),
            ),
            Card(
              child: Text(data["url"],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20.0),
              ),
            )
          ],
        ),//Colum
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => Welcome()),
        );
      },
        child: Icon(Icons.home),
        backgroundColor: Colors.green,
      ),
    //Center
    ):Cargador()

    ;//Scaffold
  }
  @override
  void initState() {
    super.initState();
    this.getRMData( );
  }
}