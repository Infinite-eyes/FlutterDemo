import 'dart:async';
import 'dart:collection';

import 'package:flutterapp/api/tmdb_api.dart';
import 'package:flutterapp/model/movie_genre.dart';
import 'package:flutterapp/model/movie_genre_list.dart';

import 'bloc_provider.dart';

class ApplicationBloc implements BlocBase {
  StreamController<List<MovieGenre>> _syncController = StreamController<List<MovieGenre>>.broadcast();
  Stream<List<MovieGenre>> get outMovieGenres => _syncController.stream;


  StreamController<List<MovieGenre>> _cmdController = StreamController<List<MovieGenre>>.broadcast();
  StreamSink get getMovieGenres => _cmdController.sink;

  ApplicationBloc() {

    api.movieGenres().then((list) {
      _genreList = list;
      getMovieGenres.add(null);
    });

    _cmdController.stream.listen((_) {
      _syncController.sink
          .add(UnmodifiableListView<MovieGenre>(_genreList.genres));
    });
  }

  void dispose() {
    _syncController.close();
    _cmdController.close();
  }

  MovieGenresList _genreList;
}
