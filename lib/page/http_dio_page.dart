import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpDioPage extends StatefulWidget {
  HttpDioPage({Key key}) : super(key: key);

  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpDioPage> {
  List _list = [];

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  _getData() async {
    var apiUrl =
        "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1";
    Response result = await Dio().get(apiUrl);
//    print(json.decode(result.data));

    //刷新
    setState(() {
      this._list = json.decode(result.data)["result"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("请求数据demo"),
        ),
//      body: this._list.length > 0
//          ? ListView.builder(
//        itemCount: this._list.length,
//        itemBuilder: (context, index) {
//          return ListTile(title: Text("${this._list[index]["title"]}"));
//        },
//      )
//          : Text("加载中..."),

        body: this._list.length > 0
            ? ListView(
                children: this._list.map((value) {
                  return ListTile(
                    title: Text(value["title"]),
                  );
                }).toList(),
              )
            : Text("加载中...")

//      body: Text("请求数据"),
        );
  }
}
