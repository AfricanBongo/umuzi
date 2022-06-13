import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:umuzi/bloc/places_list/place_type.dart';
import 'package:umuzi/data/repository/places_of_type_repository.dart';

import '../../data/model/place.dart';

part 'places_of_type_state.dart';

/// Facilitates retrieving a list of [Place].
///
/// Consists of four states:
///
/// - [PlacesOfTypeInitial]
///
/// - [PlacesOfTypeLoadInProgress]
///
/// - [PlacesOfTypeLoadSuccess]
///
/// - [PlacesOfTypeLoadFailure]
class PlacesOfTypeCubit extends Cubit<PlacesOfTypeState> {
  /// Repository to fetch data about places.
  final PlacesOfTypeRepository _repository;

  PlacesOfTypeCubit(this._repository) : super(PlacesOfTypeInitial());

  /// Attempts to retrieve the list of places.
  ///
  /// [type] Required parameter - The type of place to query for.
  void fetchPlaces(PlaceType type) async {
    // Indicate that the data is being fetched.
    emit(PlacesOfTypeLoadInProgress());

    // Fetch the places from the repository.
    final places = await _repository.getPlacesOfType(type.name);

    // Only load data when the list is not empty, else emit failure state.
    if (places != null) {
      emit(PlacesOfTypeLoadSuccess(places));
    } else {
      emit(const PlacesOfTypeLoadFailure("Error occurred whilst trying to fetch data."));
    }
  }
}
