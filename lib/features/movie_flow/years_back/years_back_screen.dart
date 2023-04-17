import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';
import 'package:movie_recommendation_app/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_recommendation_app/features/movie_flow/result/result_screen.dart';

class YearsBackScreen extends ConsumerWidget {
  const YearsBackScreen({
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
              'How many years back should we check for?',
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${movieFlowController.yearsBack}',
                  style: theme.textTheme.headline2,
                ),
                Text(
                  'Years back',
                  style: theme.textTheme.headline4?.copyWith(
                    color: theme.textTheme.headline4?.color?.withOpacity(0.62),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Slider(
              value: movieFlowController.yearsBack.toDouble(),
              min: 0,
              max: 70,
              divisions: 70,
              label: '${movieFlowController.yearsBack}',
              onChanged: (value) {
                ref.read(movieFlowControllerProvider.notifier).updateYearsBack(
                      value.toInt(),
                    );
              },
            ),
            const Spacer(),
            PrimaryButton(
                onPressed: () => Navigator.push(
                      context,
                      ResultScreen.route(),
                    ),
                text: 'Amazing'),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
