import 'package:flutter/material.dart';

class ProductInfoPage extends StatefulWidget {
  Map arguments;

  ProductInfoPage({Key key, this.arguments}) : super(key: key);

  _ProductPageInfoState createState() => _ProductPageInfoState();
}

class _ProductPageInfoState extends State<ProductInfoPage> {
//  Map arguments;
//  _ProductPageInfoState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text("pid=${widget.arguments["pid"]}"),
//      child: Text("pid=${arguments["pid"]}"),
      ),
    );
//    return Container(
//      child: Text("pid=${widget.arguments["pid"]}"),
////      child: Text("pid=${arguments["pid"]}"),
//    );
  }
}
