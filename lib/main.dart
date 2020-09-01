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
  double usd;
  double eur;
  double gbp;

  String toUsd() {
    return (_currentSliderValue / usd).toStringAsFixed(2);
  }

  String toEur() {
    return (_currentSliderValue / usd).toStringAsFixed(2);
  }

  String toGbp() {
    return (_currentSliderValue / usd).toStringAsFixed(2);
  }

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
                  return Center(child: Text("Error"));
                case (ConnectionState.waiting):
                  return SingleChildScrollView(
                      child: Column(children: <Widget>[
                    Slider(
                      value: _currentSliderValue,
                      activeColor: Colors.deepPurple,
                      inactiveColor: Colors.deepPurple,
                      min: 0,
                      max: 10,
                      divisions: 10,
                      label: ' R\$ ' + _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                          toEur();
                          toGbp();
                          toUsd();
                        });
                      },
                    ),
                    buildCard("EUR", "€", _currentSliderValue, ""),
                    buildCard("GBP", "£", _currentSliderValue, ""),
                    buildCard("USD", "\$", _currentSliderValue, ""),
                  ]));
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error..."),
                    );
                  } else {
                    usd = snapshot.data["results"]["currencies"]["USD"]["buy"];
                    eur = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                    gbp = snapshot.data["results"]["currencies"]["GBP"]["buy"];
                    return SingleChildScrollView(
                        child: Column(children: <Widget>[
                      Slider(
                        value: _currentSliderValue,
                        activeColor: Colors.deepPurple,
                        inactiveColor: Colors.deepPurple,
                        min: 0,
                        max: 10,
                        divisions: 10,
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                            toEur();
                            toGbp();
                            toUsd();
                          });
                        },
                      ),
                      buildCard("EUR", "€", _currentSliderValue, toEur()),
                      buildCard("GBP", "£", _currentSliderValue, toGbp()),
                      buildCard("USD", "\$", _currentSliderValue, toUsd()),
                    ]));
                  }
              }
            }));
  }
}

Widget buildCard(
    String currency, String prefix, double sliderValue, String text) {
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
          subtitle: Text('BRL to $currency.'),
        ),
        ButtonBar(
          children: <Widget>[
            FlatButton(
              child: Text("R\$ $sliderValue"),
              textColor: Colors.grey,
              onPressed: () {/* ... */},
            ),
            Icon(Icons.arrow_right),
            FlatButton(
              child: Text(
                '$prefix $text',
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
