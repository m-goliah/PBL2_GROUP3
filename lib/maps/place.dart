import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'dart:typed_data';
import 'dart:io';
import 'dart:convert';
import 'package:memo_pbl2/maps/position.dart';


//to get detail info about places
class Place {
  // List<Map<String,dynamic>> geometry;
  // List<String> name;
  Map geometry1;
  String name1;
  String placeId1;
  Map geometry2;
  String name2;
  String placeId2;
  Map geometry3;
  String name3;
  String placeId3;
  String type;
  double lat;
  double lng;
  Place(this.lat,this.lng,this.type);
  // Position latLng;
  changePos(lat,lng){
    this.lat = lat;
    this.lng = lng;
  }
  get() async {
    var httpClient = new HttpClient();
    // String uri = 'https://jsonplaceholder.typicode.com/posts/1';
    // String uri = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=lawson&location=33.59587420,130.238100&radius=2000&key=AIzaSyAW2IuelHY1Op8I71A5RSKfD4lZAFQ8lhQ";
    String uri = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=$type&keyword=&rankby=distance&key=AIzaSyAW2IuelHY1Op8I71A5RSKfD4lZAFQ8lhQ";

    // https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=33.59587420,130.238100&type=subway_station&keyword=&rankby=distance&key=AIzaSyAW2IuelHY1Op8I71A5RSKfD4lZAFQ8lhQ
    var url = Uri.parse(uri);
    print("----------------- ----------------- --------------");
    var request = await httpClient.getUrl(url);
    print("45345345345435345");
    var response = await request.close();
    var responseBody = await response.transform(Utf8Decoder()).join();
    var data = jsonDecode(responseBody);
    Map<String, dynamic> newData = data;
    // List<Map> newData = data["results"];
    // geometry.add(newData["results"][0]["geometry"]);
    // name.add(newData["results"][0]["name"]);
    geometry1 = newData["results"][0]["geometry"];
    name1 = newData["results"][0]["name"];
    placeId1 = newData["results"][0]["place_id"];
    print(newData["results"][0]["geometry"]["location"]);
    print(newData["results"][0]["name"]);
    print(newData["results"][0]["place_id"]);
    geometry2 = newData["results"][1]["geometry"];
    name2 = newData["results"][1]["name"];
    placeId2 = newData["results"][1]["place_id"];
    print(newData["results"][1]["geometry"]["location"]);
    print(newData["results"][1]["name"]);
    print(newData["results"][1]["place_id"]);
    geometry3 = newData["results"][2]["geometry"];
    name3 = newData["results"][2]["name"];
    placeId3 = newData["results"][2]["place_id"];
    print(newData["results"][2]["geometry"]["location"]);
    print(newData["results"][2]["name"]);
    print(newData["results"][2]["place_id"]);
    // for(int i=0;i<5;i++){
    //   geometry.add(newData["results"][i]["geometry"]);
    //   name.add(newData["results"][i]["name"]);
    // }
    // geometry = newData[0]["geometry"];
    // name = newData[0]["name"];
    // print(newData[0]["geometry"]["location"]);
    // print(newData[0]["name"]);
  }
}
