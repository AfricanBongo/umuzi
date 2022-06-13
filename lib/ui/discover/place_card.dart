import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:umuzi/data/model/place.dart';

import '../components/border.dart';
import '../components/price_level_card.dart';
import '../components/rating_chip.dart';
import '../components/text.dart';
import '../theme.dart';

class PlaceCard extends StatelessWidget {
  final Place place;

  /// Whether or not the pricing chip should be included
  final bool withPricing;
  const PlaceCard({Key? key, required this.place, this.withPricing = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final containerWidth = MediaQuery.of(context).size.width;
    return Container(
      width: containerWidth / 2.5,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          border: mediumContainerBorder(Colors.black),
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(mediumContainerRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Place photo
          _loadImage(place.photoUrl, context),

          Divider(
            height: 1.6,
            thickness: 1.6,
            color: Theme.of(context).colorScheme.onBackground,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Place name
                BodyText(
                  place.name,
                  bodyStyleNumber: 1,
                  textColor: darkGreen,
                  highEmphasis: true,
                ),
                // Place address
                BodyText(
                  place.address,
                  bodyStyleNumber: 2,
                  textColor: lowEmphasisGreen,
                ),

                const SizedBox(
                  height: 16,
                ),

                // Have extra chip for pricing
                (withPricing)
                    ?
                    // Rating
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PriceLevelChip(place.priceLevel),
                          const SizedBox(
                            height: 4,
                          ),
                          IntrinsicWidth(child: RatingChip(place.rating)),
                        ],
                      )
                    : IntrinsicWidth(child: RatingChip(place.rating)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _loadImage(String? photoUrl, BuildContext context) {
    final errorWidget = Image.asset(
      'assets/error_image.png',
      fit: BoxFit.fill,
      height: 120,
    );

    return
        // If the photo url is null then show the error image.
        (place.photoUrl != null)
            ? FancyShimmerImage(
                imageUrl: place.photoUrl!,
                boxFit: BoxFit.cover,
                height: 120,
                errorWidget: errorWidget)
            : errorWidget;
  }
}
