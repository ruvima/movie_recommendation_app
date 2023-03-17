import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/theme/pallete.dart';

class CustomTheme {
  static ThemeData darkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: MaterialColor(
          Pallete.red500.value,
          const {
            100: Pallete.red100,
            200: Pallete.red200,
            300: Pallete.red300,
            400: Pallete.red400,
            500: Pallete.red500,
            600: Pallete.red600,
            700: Pallete.red700,
            800: Pallete.red800,
            900: Pallete.red900,
          },
        ),
      ).copyWith(
        secondary: Pallete.red500,
      ),
      scaffoldBackgroundColor: Pallete.almostBlack,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Pallete.almostBlack,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade800,
        thumbColor: Colors.white,
        valueIndicatorColor: Pallete.red500,
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
      ),
      textTheme: theme.primaryTextTheme
          .copyWith(
            button: theme.primaryTextTheme.button?.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
          .apply(
            displayColor: Colors.white,
          ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Pallete.red500,
        ),
      ),
    );
  }
}
