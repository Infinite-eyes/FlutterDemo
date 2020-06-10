


import 'package:flutterapp/bloc/bloc_provider.dart';
import 'package:flutterapp/model/movie_page_result.dart';

class MovieCatalogBloc implements BlocBase{


  final int _moviesPerPage = 20;
  int _genre = 28;

  int _minReleaseDate = 2000;
  int _maxReleaseDate = 2005;

  int _totalMovies = -1;

  final _fetchPages = <int,MoviePageResult>{};

  final _pagesBeingFetched = Set<int>();





  @override
  void dispose() {
    // TODO: implement dispose
  }


}