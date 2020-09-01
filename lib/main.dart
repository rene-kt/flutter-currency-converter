// Flutter code sample for Card

// This sample shows creation of a [Card] widget that shows album information
// and two actions.

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=e6fa1f5f";

void main() async {
  runApp(MaterialApp(
    home: Home(),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  print(response.body);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Currency Converter"),
          backgroundColor: Colors.deepPurple,
        ),
        body: FutureBuilder<Map>(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case (ConnectionState.none):
                case (ConnectionState.waiting):
                  return Center(
                    child: Text("Loading data..."),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error..."),
                    );
                  } else {
                    return SingleChildScrollView(
                        child: Column(children: <Widget>[
                      Slider(
                        value: _currentSliderValue,
                        activeColor: Colors.deepPurple,
                        inactiveColor: Colors.deepPurple,
                        min: 0,
                        max: 10,
                        divisions: 10,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                      buildCard("EUR", "€", _currentSliderValue),
                      buildCard("LIB", "£", _currentSliderValue),
                      buildCard("USD", "\$", _currentSliderValue),
                    ]));
                  }
              }
            }));
  }
}

Widget buildCard(String currency, String prefix, double sliderValue) {
  return Card(
      child: AnimatedContainer(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    ),
    duration: Duration(seconds: 1),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.attach_money),
          title: Text(
            '$prefix $currency',
            style: TextStyle(color: Colors.deepPurple),
          ),
          subtitle: Text('Conversão de Reais para $currency.'),
        ),
        ButtonBar(
          children: <Widget>[
            FlatButton(
              child: Text("R\$ $sliderValue.00"),
              textColor: Colors.grey,
              onPressed: () {/* ... */},
            ),
            Icon(Icons.arrow_right),
            FlatButton(
              child: Text(
                '$prefix $currency',
                style: TextStyle(color: Colors.deepPurple),
              ),
              onPressed: () {/* ... */},
            ),
          ],
        ),
      ],
    ),
  ));
}
