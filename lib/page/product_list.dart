import 'package:flutter/material.dart';
import 'package:flutterapp/page/secondscreen.dart';

const String words1 = "Almost before we knew it, we had left the ground.";
const String words2 = "A shining crescent far beneath the flying vessel.";
const String words3 = "A red flair silhouetted the jagged edge of a wing.";
const String words4 = "Mist enveloped the ship three hours out from port.";



class Product {
  final String title;
  final String description;

  Product(this.title, this.description);
}

void main() {
  runApp(new MaterialApp(
    title: '传递数据示例',
    home: new ProductList(
        products:
        new List.generate(20, (i) => new Product('商品 $i', '这是一个商品的详情 $i'))),
  ));
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("商品列表"),
      ),
      body: new ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text(products[index].title),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>
                      new ProductDetail(product: products[index])));
            },
          );
        },
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${product.title}'),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Text('${product.description}'),
      ),
    );
  }
}
