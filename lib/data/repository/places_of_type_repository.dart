import 'package:google_maps_webservice/places.dart';
import 'package:umuzi/data/model/util.dart';
import 'package:umuzi/data/repository/photo_repository.dart';

import '../model/place.dart';

class PlacesOfTypeRepository extends PhotoRepository{

  /// Retrieves places of a certain type, e.g. restaurant, shopping mall.
  ///
  /// [type] - The type of place that is being searched for.
  Future<List<Place>?> getPlacesOfType(String type) async {
    final response = await api.getPlacesOfType(type);
    final results = response?.results;
    List<Place>? listOfPlaces = [];
    if (results != null) {
      PlacesSearchResult result;
      String? photoReference;
      String? photoUrl;
      for (int i = 0; i < results.length; i++) {
        result = results[i];
        if (result.photos.isNotEmpty) {

          photoReference = result.photos.first.photoReference;
        }
        photoUrl = await getPhotoOfPlace(photoReference);
        listOfPlaces.add(result.toPlace(photoUrl));
      }
    }

    return listOfPlaces;
  }
}