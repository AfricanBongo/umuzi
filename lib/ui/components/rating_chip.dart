import 'package:flutter/material.dart';
import 'package:umuzi/ui/components/small_card.dart';
import 'package:umuzi/ui/components/text.dart';

/// Displays a rating for a place.
class RatingChip extends StatelessWidget {
  final double? rating;
  final bool? withStroke;
  const RatingChip(this.rating, {Key? key, this.withStroke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ratingText = rating?.toStringAsFixed(1) ?? 'No rating';

    return SmallCard(
      withStroke: withStroke ?? true,
      child: Row(
        children: [
          // Star icon
          Icon(
            Icons.star,
            color: Theme.of(context).colorScheme.secondary,
            size: 16,
          ),
          const SizedBox(width: 4,),
          SmallText(
            ratingText
          )
        ],
      ),
    );
  }
}
