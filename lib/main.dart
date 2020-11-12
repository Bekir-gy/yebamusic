import 'dart:js_util';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Widget home() {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("YEBA Music Player"),
        ),
        body: new ListView.builder(
          itemCount: 0,
          itemBuilder: (context, int index) {
            return new ListTile(
              leading: new CircleAvatar(
                child: new Text("ppppp"),
              ),
              title: new Text("data"),
            );
          },
        ),
      );
    }

    return MaterialApp(
      home: home(),
    );
  }
}
