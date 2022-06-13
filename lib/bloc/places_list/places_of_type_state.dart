part of 'places_of_type_cubit.dart';

abstract class PlacesOfTypeState extends Equatable{
  const PlacesOfTypeState();
}

class PlacesOfTypeInitial extends PlacesOfTypeState {
  @override
  List<Object?> get props => [];
}

/// The state when a request for the data has been made.
class PlacesOfTypeLoadInProgress extends PlacesOfTypeState {
  @override
  List<Object?> get props => [];

}

/// The state when the list of places has been fetched successfully.
class PlacesOfTypeLoadSuccess extends PlacesOfTypeState {
  final List<Place> places;
  const PlacesOfTypeLoadSuccess(this.places);

  @override
  List<Object?> get props => [places];
}

/// The state when an error occurs within fetch the list of places.
class PlacesOfTypeLoadFailure extends PlacesOfTypeState {
  final String errorMessage;
  const PlacesOfTypeLoadFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
