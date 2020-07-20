import 'package:flutter/material.dart';

void main() {
  //new 关键词可以省略 v1
//  runApp(new Center(
//      child: new Text(
//    '你好flutter',
//    textDirection: TextDirection.ltr,
//  )));
//v2
//  runApp(Center(
//      child: Text(
//    '你好flutter',
//    textDirection: TextDirection.ltr,
//  )));

// v3
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeContent();
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
