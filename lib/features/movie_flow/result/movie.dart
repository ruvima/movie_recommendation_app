// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/genre.dart';

class Movie {
  final String title;
  final String overview;
  final num voteAverage;
  final List<Genre> genres;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;
  const Movie({
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.genres,
    required this.releaseDate,
    this.backdropPath,
    this.posterPath,
  });

  Movie.initial()
      : title = '',
        overview = '',
        voteAverage = 0,
        genres = [],
        releaseDate = '',
        backdropPath = '',
        posterPath = '';

  String get genresCommaSeparated =>
      genres.map((e) => e.name).toList().join(', ');

  @override
  String toString() {
    return 'Movie(title: $title, overview: $overview, voteAverage: $voteAverage, genres: $genres, releaseDate: $releaseDate, backdropPath: $backdropPath, posterPath: $posterPath)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.overview == overview &&
        other.voteAverage == voteAverage &&
        listEquals(other.genres, genres) &&
        other.releaseDate == releaseDate &&
        other.backdropPath == backdropPath &&
        other.posterPath == posterPath;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        overview.hashCode ^
        voteAverage.hashCode ^
        genres.hashCode ^
        releaseDate.hashCode ^
        backdropPath.hashCode ^
        posterPath.hashCode;
  }
}