import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/genre.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.onTap,
    required this.genre,
  }) : super(key: key);
  final VoidCallback onTap;
  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Material(
        color: genre.isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent,
        borderRadius: BorderRadius.circular(kBorderRaidus),
        child: InkWell(
          borderRadius: BorderRadius.circular(kBorderRaidus),
          onTap: onTap,
          child: Container(
            width: 140,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Text(
              genre.name,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
