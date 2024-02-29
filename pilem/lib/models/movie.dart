import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterpath;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterpath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        posterpath: json["poster_path"],
        backdropPath: json['poster_path'],
        releaseDate: json['release_date'],
        voteAverage: double.parse(json['vote_average']));
  }
}
