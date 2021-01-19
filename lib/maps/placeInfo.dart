import 'package:google_place/google_place.dart';
import 'dart:typed_data';


//to get detail info about places
class PlaceInfo{
  final String placeId;
  final GooglePlace googlePlace;
  DetailsResult detailsResult;
  List<Uint8List> images = [];
  PlaceInfo(this.placeId,this.googlePlace);
  void getDetails(String placeId) async {
    var result = await this.googlePlace.details.get(placeId);
    if (result != null && result.result != null) {
        detailsResult = result.result;
        images = [];
      }

      if (result.result.photos != null) {
        for (var photo in result.result.photos) {
          getPhoto(photo.photoReference);
        }
      }
    }
  void getPhoto(String photoReference) async {
    var result = await this.googlePlace.photos.get(photoReference, null, 400);
    if (result != null) {
        images.add(result);
      }
    }
}