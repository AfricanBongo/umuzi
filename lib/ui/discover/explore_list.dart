import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:umuzi/bloc/places_list/place_type.dart';
import 'package:umuzi/bloc/places_list/places_of_type_cubit.dart';
import 'package:umuzi/data/model/place.dart';
import 'package:umuzi/data/repository/places_of_type_repository.dart';
import 'package:umuzi/ui/components/text.dart';
import 'package:umuzi/ui/discover/place_card.dart';

class ExploreList extends StatelessWidget {
  const ExploreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesOfTypeCubit, PlacesOfTypeState>(
      builder: (context, state) {
        if (state is PlacesOfTypeLoadSuccess) {
          final listOfPlaces = state.places;
          return SliverMasonryGrid(
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final place = listOfPlaces[index];
                return PlaceCard(place: place);
              },
              childCount: listOfPlaces.length,
            ),
          );
        } else if (state is PlacesOfTypeLoadFailure) {
          _buildAtCenter(HeadlineText(
            state.errorMessage,
            headlineStyleNumber: 6,
            textColor: Theme.of(context).colorScheme.primary,
          ));
        }

        return _buildAtCenter(const CircularProgressIndicator());
      },
    );
  }

  Widget _buildAtCenter(Widget child) {
    return SliverFillRemaining(
      child: SizedBox(height: 60, width: 60, child: Center(child: child)),
    );
  }
}
