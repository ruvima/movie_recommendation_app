import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';
import 'package:movie_recommendation_app/features/movie_flow/movie_flow_controller.dart';

class RatingScreen extends ConsumerWidget {
  const RatingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final movieFlowController = ref.watch(movieFlowControllerProvider);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () =>
              ref.read(movieFlowControllerProvider.notifier).previousPage(),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Select a minimum rating ranging from 1-10',
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${movieFlowController.rating.ceil()}',
                  style: theme.textTheme.headline2,
                ),
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 62,
                ),
              ],
            ),
            const Spacer(),
            Slider(
              onChanged: (value) {
                ref.read(movieFlowControllerProvider.notifier).updateRating(
                      value.toInt(),
                    );
              },
              value: movieFlowController.rating.toDouble(),
              min: 1,
              max: 10,
              divisions: 10,
              label: '${movieFlowController.rating}',
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: () =>
                  ref.read(movieFlowControllerProvider.notifier).nextPage(),
              text: 'Yes please',
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
