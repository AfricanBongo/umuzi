import 'package:umuzi/data/repository/api_repository.dart';

import '../model/place.dart';
import '../model/util.dart';

class SearchRepository extends ApiRepository {
  /// Retrieves places of based on the [query], e.g. 'Jet'.
  ///
  /// Required parameter - A string query that contains the keywords
  /// used to fetch the list of places.
  Future<List<Place>?> getPlacesFromQuery(String query) async {
    final response = await api.getPlacesFromQuery(query);
    final results = response?.results;

    // Null is passed in the 'toPlace()' function
    // because a photoUrl is not essential for searches.
    return results?.map((placeResult) => placeResult.toPlace(null)).toList();
  }
}