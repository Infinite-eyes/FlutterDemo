import 'package:flutterapp/bloc/bloc_provider.dart';
import 'package:flutterapp/model/movie_card.dart';

class FavoriteBloc implements BlocBase {

  final Set<MovieCard> _favorites = Set<MovieCard>();

//  BehaviorSubject<MovieCard> _favoriteAddController = new BehaviorSubject<MovieCard>();


  @override
  void dispose() {
    // TODO: implement dispose
  }
}
