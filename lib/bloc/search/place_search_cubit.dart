import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:umuzi/data/repository/search_repository.dart';

import '../../data/model/place.dart';

part 'place_search_state.dart';

/// Facilitates retrieving a list of [Place].
///
/// Consists of four states:
///
/// - [PlaceSearchInitial]
///
/// - [PlaceSearchLoadInProgress]
///
/// - [PlaceSearchLoadSuccess]
///
/// - [PlaceSearchLoadFailure]
///
class PlaceSearchCubit extends Cubit<PlaceSearchState> {
  /// Repository to fetch data about places.
  final SearchRepository _repository;

  PlaceSearchCubit(this._repository) : super(PlaceSearchInitial());

  /// Attempts to retrieve the list of places.
  ///
  /// [type] Required parameter - The type of place to query for.
  void fetchPlaces(String query) async {
    // Indicate that the data is being fetched.
    emit(PlaceSearchLoadInProgress());

    // Fetch the places from the repository.
    final places = await _repository.getPlacesFromQuery(query);

    // Only load data when the list is not empty, else emit failure state.
    if (places != null) {
      emit(PlaceSearchLoadSuccess(places));
    } else {
      emit(const PlaceSearchLoadFailure("Error occurred whilst trying to fetch data."));
    }
  }
}
