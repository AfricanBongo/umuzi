import '../provider/places_api.dart';

class ApiRepository {
  late PlacesAPI _api;

  // Accesses the Google Places API.
  PlacesAPI get api{
    return _api;
  }

  ApiRepository() {
    _api = PlacesAPI();
  }
}