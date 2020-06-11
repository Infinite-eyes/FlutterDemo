import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/bloc/bloc_provider.dart';
import 'package:flutterapp/bloc/favorite_bloc.dart';
import 'package:flutterapp/bloc/movie_catalog_bloc.dart';
import 'package:flutterapp/page/movie/widgets/favorite_button.dart';

class ListPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final MovieCatalogBloc movieBloc = BlocProvider.of<MovieCatalogBloc>(
        context);
    final FavoriteBloc favoriteBloc = BlocProvider.of<FavoriteBloc>(context);


    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title:  Text('List Page'),
        actions:<Widget>[
          FavoriteButton(child:const Icon(Icons.favorite)),
          IconButton(
            icon: const Icon(Icons.more_horiz),

          )
        ]
      ),

    );
  }
}
