import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.width = double.infinity,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final double width;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRaidus / 2),
          ),
          fixedSize: Size(
            width,
            48,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onPrimary,
                  )
                : Text(
                    text,
                    style: Theme.of(context).textTheme.button,
                  ),
          ],
        ),
      ),
    );
  }
}
