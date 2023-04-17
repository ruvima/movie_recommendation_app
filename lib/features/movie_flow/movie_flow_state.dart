// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/genre.dart';
import 'package:movie_recommendation_app/features/movie_flow/result/movie.dart';

const movieMock = Movie(
  title: 'M3GAN',
  overview:
      'Un ingeniero en robótica de una empresa de juguetes construye una muñeca realista que comienza a cobrar vida propia',
  voteAverage: 7.4,
  genres: [
    Genre(name: 'Horror'),
    Genre(name: 'Comedy'),
  ],
  releaseDate: '29-12-2022',
  backdropPath: '',
  posterPath: '',
);

const List<Genre> genresMock = [
  Genre(name: 'Action'),
  Genre(name: 'Comedy'),
  Genre(name: 'Horror'),
  Genre(name: 'Anime'),
  Genre(name: 'Drama'),
  Genre(name: 'Family'),
  Genre(name: 'Romance'),
];

@immutable
class MovieFlowState {
  final PageController pageController;
  final int rating;
  final int yearsBack;
  final List<Genre> genres;
  final Movie movie;

  const MovieFlowState({
    required this.pageController,
    this.rating = 5,
    this.yearsBack = 10,
    this.genres = genresMock,
    this.movie = movieMock,
  });

  MovieFlowState copyWith({
    PageController? pageController,
    int? rating,
    int? yearsBack,
    List<Genre>? genres,
    Movie? movie,
  }) {
    return MovieFlowState(
      pageController: pageController ?? this.pageController,
      rating: rating ?? this.rating,
      yearsBack: yearsBack ?? this.yearsBack,
      genres: genres ?? this.genres,
      movie: movie ?? this.movie,
    );
  }

  @override
  bool operator ==(covariant MovieFlowState other) {
    if (identical(this, other)) return true;

    return other.pageController == pageController &&
        other.rating == rating &&
        other.yearsBack == yearsBack &&
        listEquals(other.genres, genres) &&
        other.movie == movie;
  }

  @override
  int get hashCode {
    return pageController.hashCode ^
        rating.hashCode ^
        yearsBack.hashCode ^
        genres.hashCode ^
        movie.hashCode;
  }
}
