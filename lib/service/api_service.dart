import 'package:http/http.dart' as http;

import '../api/api_key.dart';
import '../model/movie_details_model.dart';
import '../model/search_mode_model.dart';

class ApiService {
  static Future<SearchMovieModel> getMovieByName(
      String movieName, int page) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://www.omdbapi.com/?apikey=$myApikKey&s=$movieName&type=movie&page=$page');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      return searchMovieModelFromJson(response.body);
    } else {
      throw Exception('Error: fetch api search request');
    }
  }

  static Future<MovieDetailsModel> getMovieById(String imdbId) async {
    var client = http.Client();

    var uri = Uri.parse('https://www.omdbapi.com/?apikey=$myApikKey&i=$imdbId');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      return movieDetailsModelFromJson(response.body);
    } else {
      throw Exception('Error: fetch api search request');
    }
  }
}
