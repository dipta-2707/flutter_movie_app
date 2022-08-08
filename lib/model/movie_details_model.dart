// To parse this JSON data, do
//
//     final movieDetailsModel = movieDetailsModelFromJson(jsonString);

import 'dart:convert';

MovieDetailsModel movieDetailsModelFromJson(String str) =>
    MovieDetailsModel.fromJson(json.decode(str));

String movieDetailsModelToJson(MovieDetailsModel data) =>
    json.encode(data.toJson());

class MovieDetailsModel {
  MovieDetailsModel({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbId,
    required this.type,
    required this.response,
  });

  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  String imdbRating;
  String imdbVotes;
  String imdbId;
  String type;
  String response;

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        title: json["Title"],
        year: json["Year"],
        rated: json["Rated"],
        released: json["Released"],
        runtime: json["Runtime"],
        genre: json["Genre"],
        director: json["Director"],
        writer: json["Writer"],
        actors: json["Actors"],
        plot: json["Plot"],
        language: json["Language"],
        country: json["Country"],
        awards: json["Awards"],
        poster: json["Poster"],
        imdbRating: json["imdbRating"],
        imdbVotes: json["imdbVotes"],
        imdbId: json["imdbID"],
        type: json["Type"],
        response: json["Response"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "Rated": rated,
        "Released": released,
        "Runtime": runtime,
        "Genre": genre,
        "Director": director,
        "Writer": writer,
        "Actors": actors,
        "Plot": plot,
        "Language": language,
        "Country": country,
        "Awards": awards,
        "Poster": poster,
        "imdbRating": imdbRating,
        "imdbVotes": imdbVotes,
        "imdbID": imdbId,
        "Response": response,
      };
}
