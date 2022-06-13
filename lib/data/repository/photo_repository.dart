import 'package:umuzi/data/repository/api_repository.dart';

/// A repository that fetches photos of a place.
class PhotoRepository extends ApiRepository{
  /// Retrieve the photo url of an associated place.
  ///
  /// [photoReference] Required parameter - The reference to the actual photo.
  Future<String?> getPhotoOfPlace(String? photoReference) async {
    if (photoReference != null) {
      return await api.getPhotoUrlOfPlace(photoReference);
    }

    return null;
  }
}