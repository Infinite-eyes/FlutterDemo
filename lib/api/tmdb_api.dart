import 'dart:convert';
import 'dart:io';

import 'package:flutterapp/model/movie_genre_list.dart';

TmdbApi api = TmdbApi();

class TmdbApi {
//  static const String TMDB_API_KEY = "PUT YOUR KEY, HERE";
  static const String TMDB_API_KEY = "2be9903044736f133ac522eaee904194"; //要翻墙
  static const String baseUrl = 'api.themoviedb.org';
  final String imageBaseUrl = 'http://image.tmdb.org/t/p/w185/';

  final _httpClient = new HttpClient();

  Future<MovieGenresList> movieGenres({String type: "movie"}) async {
    var uri = Uri.https(baseUrl,
        '3/genre/$type/list',
        <String, String>{
      'api_key': TMDB_API_KEY,
      'language': 'en-US',
    });

    var response = await _getRequest(uri);
    MovieGenresList list = MovieGenresList.fromJSON(json.decode(response));

    return list;
  }

  Future<String> _getRequest(Uri uri) async {
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();

    return response.transform(utf8.decoder).join();
  }
}
