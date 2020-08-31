// Flutter code sample for Card

// This sample shows creation of a [Card] widget that shows album information
// and two actions.

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Currency Converter"),
        ),
        body: Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text('€ EURO'),
                  subtitle: Text('Conversão de Reais para Euro.'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text("R\$ REAIS"),
                      textColor: Colors.grey,
                      onPressed: () {/* ... */},
                    ),
                    Icon(Icons.arrow_right),
                    FlatButton(
                      child: Text('€ EURO'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
