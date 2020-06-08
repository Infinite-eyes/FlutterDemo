import 'dart:convert';

import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

_getData() async {
  var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse['totalItems'];
    print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

}

_postData() async{
  var apiUrl = "http://127.0.0.1:3000/dologin";

  var result = await http.post(apiUrl, body: {'username': '张三', 'age': '20'});
  if (result.statusCode == 200) {
    print(json.decode(result.body));
  }else{
    print(result.statusCode);
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
//    Map userInfo = {"username": "张三", "age": 20};
//    print(json.encode(userInfo));

//    String userinfo = '{"username":"zhangsan","age":20}';
//    Map u = json.decode(userinfo);
//    print(u["username"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('home page'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("aaa"),
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            ),
          ],
        ));
  }
}
