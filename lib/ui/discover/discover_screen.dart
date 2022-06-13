import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umuzi/bloc/places_list/place_type.dart';
import 'package:umuzi/bloc/places_list/places_of_type_cubit.dart';
import 'package:umuzi/data/repository/places_of_type_repository.dart';
import 'package:umuzi/ui/discover/explore_list.dart';
import 'package:umuzi/ui/discover/umuzi_app_bar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PlacesOfTypeCubit(PlacesOfTypeRepository())
          ..fetchPlaces(PlaceType.restaurant),
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: const CustomScrollView(slivers: [
            UmuziAppBar(
              searchPlaceholder: "I am looking for...",
            ),
            SliverPadding(
                padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
                sliver: ExploreList()),
          ]),
        ),
      ),
    );
  }
}
