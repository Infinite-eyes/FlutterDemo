import 'package:flutter/material.dart';
import 'package:flutterapp/page/counter_page.dart';
import 'package:flutterapp/page/fontspage.dart';
import 'package:flutterapp/page/http_dio_page.dart';
import 'package:flutterapp/page/http_page.dart';
import 'package:flutterapp/page/navigate_with_arguments.dart';
import 'package:flutterapp/page/product_info.dart';
import 'package:flutterapp/page/search_page.dart';
import 'package:flutterapp/page/shop_list.dart' as ShopList;
import 'package:flutterapp/page/product.dart';

final routes = {
  '/fonts': (context) => FontsPage(),
  '/shop_list': (context) => ShopList.ShoppingList(),
  '/search': (context, {arguments}) => SearchPage(arguments: arguments),
  '/product': (context) => ProductPage(),
  '/product_info': (context, {arguments}) =>
      ProductInfoPage(arguments: arguments),
  '/http': (context, {arguments}) => HttpPage(),
  '/dio': (context, {arguments}) => HttpDioPage(),
  '/counter': (context, {arguments}) => CounterPage(),
  ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
};

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
