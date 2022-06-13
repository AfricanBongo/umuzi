import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umuzi/bloc/search/place_search_cubit.dart';
import 'package:umuzi/ui/components/text.dart';
import 'package:umuzi/ui/search/search_result.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceSearchCubit, PlaceSearchState>(
      builder: (context, state) {
        if (state is PlaceSearchLoadSuccess) {
          final listOfPlaces = state.places;

          if (listOfPlaces.isEmpty) {
            return _buildAtCenter(
                const HeadlineText('No results found', headlineStyleNumber: 6));
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final place = listOfPlaces[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: SearchResult(
                    placeName: place.name!,
                    placeAddress: place.address,
                    rating: place.rating,
                  ),
                );
              },
              childCount: listOfPlaces.length,
            ),
          );
        } else if (state is PlaceSearchLoadFailure) {
          return SliverList(
              delegate: SliverChildListDelegate([
            Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.only(top: 32),
                child: const Text("Failure")),
          ]));
        }
        // Show progress indicator when either data is being fetched or it has been requested for.
        return _buildAtCenter(const CircularProgressIndicator());
      },
    );
  }

  Widget _buildAtCenter(Widget child) {
    return SliverFillRemaining(
      child: SizedBox(
          height: 60,
          width: 60,
          child: Center(child: child)),
    );
  }
}
