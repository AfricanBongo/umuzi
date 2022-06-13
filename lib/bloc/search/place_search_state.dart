part of 'place_search_cubit.dart';

abstract class PlaceSearchState extends Equatable {
  const PlaceSearchState();
}

class PlaceSearchInitial extends PlaceSearchState {
  @override
  List<Object> get props => [];
}

class PlaceSearchLoadInProgress extends PlaceSearchState {
  @override
  List<Object?> get props => [];
}

class PlaceSearchLoadSuccess extends PlaceSearchState {
  final List<Place> places;

  const PlaceSearchLoadSuccess(this.places);
  @override
  List<Object?> get props => [places];
}

/// The state when an error occurs within fetch the list of places.
class PlaceSearchLoadFailure extends PlaceSearchState {
  final String errorMessage;
  const PlaceSearchLoadFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
