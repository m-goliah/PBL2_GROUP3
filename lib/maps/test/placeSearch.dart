import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'detailPage.dart';

//to get places by googlePlace
class PlaceSearch{
  GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  List<String> placeIds;
  List<int> distances;
  String markerText;
  String apiKey = "AIzaSyAW2IuelHY1Op8I71A5RSKfD4lZAFQ8lhQ";
  PlaceSearch(this.markerText){
    googlePlace = new GooglePlace(apiKey);
    search();
    // new Future.delayed(Duration(seconds: 5));
  }
  void getPlaceIds(){
    predictions.forEach((prediction) {placeIds.add(prediction.placeId);});
  }
  void getDistances(){
    predictions.forEach((prediction) {distances.add(prediction.distanceMeters);});
  }
  //search places from marker
  void search() async{
    var result = await googlePlace.autocomplete.get(this.markerText);
    if (result != null && result.predictions != null) {
      predictions = result.predictions;
      print(predictions[0].description);
    }
  }
}