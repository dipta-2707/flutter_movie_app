// To parse this JSON data, do
//
//     final SearchMovieModel = SearchMovieModelFromJson(jsonString);

import 'dart:convert';

SearchMovieModel searchMovieModelFromJson(String str) =>
    SearchMovieModel.fromJson(json.decode(str));

String searchMovieModelToJson(SearchMovieModel data) =>
    json.encode(data.toJson());

class SearchMovieModel {
  SearchMovieModel({
    required this.search,
    required this.totalResults,
    required this.response,
  });

  List<Search> search;
  String totalResults;
  String response;

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) =>
      SearchMovieModel(
        search:
            List<Search>.from(json["Search"].map((x) => Search.fromJson(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
      );

  Map<String, dynamic> toJson() => {
        "Search": List<dynamic>.from(search.map((x) => x.toJson())),
        "totalResults": totalResults,
        "Response": response,
      };
}

class Search {
  Search({
    required this.title,
    required this.year,
    required this.imdbId,
    required this.type,
    required this.poster,
  });

  String title;
  String year;
  String imdbId;
  String type;
  String poster;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: json["Type"],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": type,
        "Poster": poster,
      };
}
