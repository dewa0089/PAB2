import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String overview;
  final String posterpath;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;

  Movie({
    required this.id,
    required this.overview,
    required this.posterpath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
  });
}
