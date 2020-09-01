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
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Currency Converter"),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
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
            Card(
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
                      '€ EURO',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    subtitle: Text('Conversão de Reais para Euro.'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text("R\$ $_currentSliderValue.00"),
                        textColor: Colors.grey,
                        onPressed: () {/* ... */},
                      ),
                      Icon(Icons.arrow_right),
                      FlatButton(
                        child: Text(
                          '€ EURO',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Card(
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
                      '£ LIBRA',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    subtitle: Text('Conversão de Reais para Libra.'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text("R\$ $_currentSliderValue.00"),
                        textColor: Colors.grey,
                        onPressed: () {/* ... */},
                      ),
                      Icon(Icons.arrow_right),
                      FlatButton(
                        child: Text(
                          '£ LIBRA',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Card(
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
                      '\$ DOLAR',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    subtitle: Text('Conversão de Reais para Dolar.'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text("R\$ $_currentSliderValue.00"),
                        textColor: Colors.grey,
                        onPressed: () {/* ... */},
                      ),
                      Icon(Icons.arrow_right),
                      FlatButton(
                        child: Text(
                          '\$ DOLAR',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ]),
        ));
  }
}
