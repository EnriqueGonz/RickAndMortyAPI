import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './cargador.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => new _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final String url = 'https://rickandmortyapi.com/api/character/';
  var id;
  List data;
  var url2;

  Future<String> getRMData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody["results"];
    });
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rick and Morty"),
        backgroundColor: Colors.green,
      ), //Appbar
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: FlatButton(
                          child: Column(
                            children: <Widget>[
                              Image.network(
                                data[index]["image"],
                                scale: 1.3,
                              ),
                              Text("     " + data[index]["name"],
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                            ],
                          ),
                          onPressed: () {
                            id = data[index]["id"];
                            url2 =
                                'https://rickandmortyapi.com/api/character/' +
                                    id.toString();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cargador(url2)),
                            ); //Navigator
                          }, //OnPressed
                        ) //FlatButton
                        ), //Container
                  ), //card
                ],
              ), //Colum
            ), //Center
          ); //Container
        },
      ), //Listview
    ); //Scaffold
  }

  @override
  void initState() {
    super.initState();
    this.getRMData();
  }
}
