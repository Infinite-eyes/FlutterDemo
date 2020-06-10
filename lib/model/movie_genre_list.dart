import 'package:flutterapp/model/movie_genre.dart';

class MovieGenresList {
  List<MovieGenre> genres = <MovieGenre>[];

  MovieGenresList.fromJSON(Map<String, dynamic> json)
      : genres = (json["genres"] as List<dynamic>)
            .map((item) => MovieGenre.fromJSON(item))
            .toList();

  MovieGenre findById(int genre) => genres.firstWhere((g) => g.genre == genre);
}
