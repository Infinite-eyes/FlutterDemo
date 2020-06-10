import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/bloc/application_bloc.dart';
import 'package:flutterapp/bloc/bloc_provider.dart';
import 'package:flutterapp/bloc/movie_catalog_bloc.dart';
import 'package:flutterapp/model/movie_genre.dart';
import 'package:flutterapp/model/movie_genre_list.dart';

/**
 * des : https://github.com/boeledi/Streams-Block-Reactive-Programming-in-Flutter
 *       https://www.jianshu.com/p/4d5e712594b4
 *
 */
class FiltersPage extends StatefulWidget {
  FiltersPage({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FiltersPageState();
  }
}

class FiltersPageState extends State<FiltersPage> {

  ApplicationBloc _appBloc;

//  MovieCatalogBloc _movieBloc;
//  double _minReleaseDate;
//  double _maxReleaseData;

  MovieGenre _movieGenre;
  List<MovieGenre> _genres;

  bool _isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_isInit == false) {
      _appBloc = BlocProvider.of<ApplicationBloc>(context);
//      _movieBloc = BlocProvider.of<MovieCatalogBloc>(context);

      _getFilterParameters();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _isInit == false
        ? Container()
        : Scaffold(
            appBar: AppBar(
                leading: Container(),
                title: Text('Filters'),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Genre:'),
                      SizedBox(width: 24.0),
                      new DropdownButton<MovieGenre>(
                        items: _genres.map((MovieGenre movieGenre) {
                          return DropdownMenuItem<MovieGenre>(
                            value: movieGenre,
                            child: new Text(movieGenre.text),
                          );
                        }).toList(),
                        value: _movieGenre,
                        onChanged: (MovieGenre newMovieGenre) {
                          _movieGenre = newMovieGenre;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  void _getFilterParameters() {
//    StreamSubscription subscriptionMovieGenres;
//    StreamSubscription subscriptionFilters;

//    subscriptionMovieGenres =
    _appBloc.outMovieGenres.listen((List<MovieGenre> data) {
      _genres = data;

      if (mounted) {
        setState(() {
          _isInit = true;
        });
      }

//      subscriptionFilters = _movieBloc.outFilters
//          _minReleaseDate = filters.min
    });

//    _appBloc.getMovieGenres.add(null);
  }
}
