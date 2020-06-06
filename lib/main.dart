import 'package:flutter/material.dart';
import 'package:flutterapp/page/fontspage.dart';
import 'package:flutterapp/page/form.dart';
import 'package:flutterapp/page/product_list.dart' as Product;
import 'package:flutterapp/page/shop_list.dart' as ShopList;

class Example {
  final String title;
  final String description;
  final String route;

  Example(this.title, this.description, this.route);
}

void main() {
  runApp(new MaterialApp(
    title: 'Shopping App',
    home: new ExampleList(
      examples: <Example>[
        new Example("fonts", "fonts pages", "FONTS"),
        new Example("shop_list", "shop_list pages", "SHOP_LIST"),
        new Example("product_list", "product_list pages", "PRODUCT_LIST"),
        new Example("form", "form pages", "FORM"),
      ],
    ),
  ));
}

class ExampleList extends StatefulWidget {
  ExampleList({Key key, this.examples}) : super(key: key);

  final List<Example> examples;

  @override
  State<StatefulWidget> createState() {
    return new _ExampleListState();
  }
}

typedef void OnItemClick(Example product);

//
class ExampleListItem extends StatelessWidget {
  ExampleListItem({Example example, this.onItemClick})
      : example = example,
        super(key: new ObjectKey(example));
  final Example example;
  final OnItemClick onItemClick;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onItemClick(example);
      },
      leading: new CircleAvatar(
        child: new Text(example.title[0]),
      ),
      title: new Text(example.title),
    );
  }
}

class _ExampleListState extends State<ExampleList> {
  Set<Example> _example = new Set<Example>();

  void _onItemClick(Example example) {
    switch (example.route) {
//    new Example("fonts", "fonts pages", "FONTS"),
//    new Example("shop_list", "shop_list pages", "SHOP_LIST"),
//    new Example("product_list", "product_list pages", "PRODUCT_LIST"),
      case "FONTS":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new FontsPage()));
        break;
      case "SHOP_LIST":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new ShopList.ShoppingList(
                      products: <ShopList.Product>[
                        new ShopList.Product(name: 'Eggs'),
                        new ShopList.Product(name: 'Flor'),
                        new ShopList.Product(name: 'Chocolate chips'),
                      ],
                    )));
        break;
      case "PRODUCT_LIST":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new Product.ProductList(
                    products: new List.generate(20,
                        (i) => new Product.Product('商品 $i', '这是一个商品的详情 $i')))));
        break;

      case "FORM":
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FormPage(title: "跳转传值");
        }));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.examples.map((Example example) {
          return new ExampleListItem(
            example: example,
            onItemClick: _onItemClick,
          );
        }).toList(),
      ),
    );
  }
}
