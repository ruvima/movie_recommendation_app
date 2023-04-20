import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation_app/features/movie_flow/movie_flow.dart';
import 'package:movie_recommendation_app/theme/custom_theme.dart';

void main() {
  runApp(
    const ProviderScope(child: App()),
  );
}

final dioProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3/'),
  ),
);

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Recomendation',
      darkTheme: CustomTheme.darkTheme(context),
      themeMode: ThemeMode.dark,
      home: const MovieFlow(),
    );
  }
}
