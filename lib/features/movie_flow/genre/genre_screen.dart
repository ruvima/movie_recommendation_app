import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/list_card.dart';
import 'package:movie_recommendation_app/features/movie_flow/movie_flow_controller.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({
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
              'Let\'s start with a genre',
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: kListItemSpacing,
                ),
                itemBuilder: (context, index) {
                  final genre = movieFlowController.genres[index];
                  return ListCard(
                    onTap: () => ref
                        .read(movieFlowControllerProvider.notifier)
                        .toggleSelected(genre),
                    genre: genre,
                  );
                },
                separatorBuilder: (_, __) =>
                    const SizedBox(height: kListItemSpacing),
                itemCount: movieFlowController.genres.length,
              ),
            ),
            PrimaryButton(
              onPressed: () =>
                  ref.read(movieFlowControllerProvider.notifier).nextPage(),
              text: 'Continue',
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
