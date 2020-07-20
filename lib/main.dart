import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("appbar title holder"),
        ),
        body: HomeContent(),
      ),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

//v4
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      '你好flutter11',
      textDirection: TextDirection.ltr,
      style: TextStyle(
          fontSize: 40.0,
//          color: Colors.blue
          color: Color.fromRGBO(0, 233, 213, 0.5)),
    ));
  }
}
