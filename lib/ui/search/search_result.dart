import 'package:flutter/material.dart';
import 'package:umuzi/ui/components/border.dart';
import 'package:umuzi/ui/components/rating_chip.dart';
import 'package:umuzi/ui/components/text.dart';
import 'package:umuzi/ui/theme.dart';

class SearchResult extends StatelessWidget {
  final double? rating;
  final String placeName;
  final String? placeAddress;
  const SearchResult(
      {Key? key, this.rating, required this.placeName, this.placeAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: mediumContainerBorder(Theme.of(context).colorScheme.primary),
          borderRadius: const BorderRadius.all(mediumContainerRadius),
          color: Theme.of(context).colorScheme.background),
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyText(
            placeName,
            bodyStyleNumber: 1,
            textColor: darkGreen,
          ),
          const SizedBox(
            height: 4,
          ),

          (placeAddress != null)
              ? BodyText(
                  placeAddress,
                  bodyStyleNumber: 2,
                  textColor: Theme.of(context).colorScheme.primary,
                )
              : const SizedBox(),

          const SizedBox(
            height: 12,
          ),

          // Show the RatingChip only if a rating is provided.
          RatingChip(
            rating,
            withStroke: false,
          )
        ],
      ),
    );
  }
}
