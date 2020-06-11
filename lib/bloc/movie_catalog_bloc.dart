import 'package:flutterapp/bloc/bloc_provider.dart';
import 'package:flutterapp/model/movie_card.dart';
import 'package:flutterapp/model/movie_page_result.dart';
import 'package:rxdart/rxdart.dart';

class MovieCatalogBloc implements BlocBase {
  final int _moviesPerPage = 20;
  int _genre = 28;

  int _minReleaseDate = 2000;
  int _maxReleaseDate = 2005;

  int _totalMovies = -1;

  final _fetchPages = <int, MoviePageResult>{};

  final _pagesBeingFetched = Set<int>();

  PublishSubject<List<MovieCard>> _moviesController =
      PublishSubject<List<MovieCard>>();

  Sink<List<MovieCard>> get _inMoviesList => _moviesController.sink;

  Stream<List<MovieCard>> get outMoviesList => _moviesController.stream;

  PublishSubject<int> _indexController = PublishSubject<int>();

  Sink<int> get inMovieIndex => _indexController.sink;

  BehaviorSubject<int> _totalMoviesController =
      BehaviorSubject<int>(seedValue: 0);
  BehaviorSubject<List<int>> _releaseDatesController =
      BehaviorSubject<List<int>>(seedValue: <int>[2000, 2020]);
  BehaviorSubject<int> _genreController = BehaviorSubject<int>(seedValue: 28);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
