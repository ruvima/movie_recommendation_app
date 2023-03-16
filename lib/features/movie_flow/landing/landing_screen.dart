import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({
    Key? key,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'Let\'s find a movie',
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Image.asset('assets/images/watching_a_movie.png'),
          const Spacer(),
          PrimaryButton(
            onPressed: nextPage,
            text: 'Get Started',
          ),
          const SizedBox(height: kMediumSpacing),
        ],
      ),
    );
  }
}
