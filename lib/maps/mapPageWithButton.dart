
import 'dart:async';
import 'dart:io';
import 'package:memo_pbl2/memos/tagList.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:memo_pbl2/alarm/NotificationOp.dart';
import 'package:memo_pbl2/alarm/NotificationPlugin.dart';
import 'package:memo_pbl2/maps/screenArguments.dart';
// import 'package:geolocator/geolocator.dart';
import 'place.dart';
import 'package:google_place/google_place.dart';
import 'test/detailPage.dart';
import 'screenArguments.dart';
import 'package:location/location.dart' as loc;
import 'package:memo_pbl2/alarm/NotificationScreen.dart';
import 'package:memo_pbl2/alarm/NotificationPlugin.dart';
import 'package:memo_pbl2/memos/edit.dart';
import 'dart:math';

class MyHomePage extends StatelessWidget{
  static const routeName = '/mapPageWithButton';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(

          title: Text("Google Map"),
          shadowColor: Colors.yellow,
          backgroundColor: Colors.blueAccent,
        ),
        body:Container(
            height: 700,
            child: HomePageBody()

        ),
    );
  }

}

class HomePageBody extends StatefulWidget {
  @override
  State<HomePageBody> createState() => HomePageBodyState();
}

class HomePageBodyState extends State<HomePageBody> {
  // Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _controller;
  GooglePlace googlePlace = GooglePlace("AIzaSyAW2IuelHY1Op8I71A5RSKfD4lZAFQ8lhQ");
  String currentSearch="検索なし";
  String currentLat;
  String currentLng;
  String currentSpeed;
  String chosenTag;
  Map tagMap = {"コンビニ":"convenience_store", "バス停":"transit_station", "学校":"school", "スーパーマーケット":"supermarket", "郵便局":"post_office", "レストラン":"restaurant"};
  // Place place = Place(33.578990, 130.242913,"convenience_store");
  Place place;
  loc.Location _location = new loc.Location();
  static final CameraPosition _initPositon = CameraPosition(
    target: LatLng(38.578990, 130.242913),
    zoom: 14.4746,
  );


  List<Marker> allMarkers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentLat = "";
    currentLng = "";
    currentSpeed = "";
    notificationPlugin
        .setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);

  }

  @override
  Widget build(BuildContext context) {
    final ChosenTag args = ModalRoute.of(context).settings.arguments;
    getTagContext(args.tags);

    return Column(
        children: [
          SizedBox(height: 10,),
          Row(

            children: [
              Container(
                width: 120,
                height: 50,
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                color: Colors.blueAccent,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),

                child: Text(
                  "Lat: "+currentLat,
                ),
              ),

              Container(
                width: 120,
                height: 50,
                color: Colors.blueAccent,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                    "Lng: "+currentLng
                ),
              ),
              Container(
                width: 120,
                height: 50,
                color: Colors.blueAccent,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                    "Speed: "+currentSpeed
                ),
              ),

            ],
          ),

          SizedBox(
              height: 500,
              child: GoogleMap(
                // padding: EdgeInsets.all(50.0),
                mapType: MapType.normal,
                initialCameraPosition: _initPositon,
                onMapCreated: (GoogleMapController controller) {
                  // _controller.complete(controller);
                  place = Place(33.578990, 130.242913,tagMap[chosenTag]);
                  _controller = controller;
                  _location.onLocationChanged.listen((l) async {
                    place.changePos(l.latitude, l.longitude);
                    currentLat = l.latitude.toString();
                    currentLng = l.longitude.toString();
                    currentSpeed = l.speed.toString();
                    CameraUpdate.newLatLng(LatLng(l.latitude,l.longitude));
                    _controller.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
                      ),
                    );
                    if(chosenTag=="カスタマイズ"){
                      _onePointMark();
                      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                      print(getDistance(l.longitude, l.latitude,Edit.selectedPlace.geometry.location.lng,Edit.selectedPlace.geometry.location.lat));
                      if(l.speed<5.0 && getDistance(l.longitude, l.latitude,Edit.selectedPlace.geometry.location.lng,Edit.selectedPlace.geometry.location.lat)<150.0){
                        await notificationPlugin.showNotification(
                        Edit.memoContent.title, Edit.memoContent.body);

                      }
                    }
                    else{
                      place.get();
                      _placeMark();
                      if(l.speed<5.0 && getDistance(l.longitude, l.latitude,place.geometry1["location"]["lng"],place.geometry1["location"]["lat"])<150.0){
                        await notificationPlugin.showNotification(
                            Edit.memoContent.title, Edit.memoContent.body);
                      }
                    }

                  });
                },
                markers: Set.from(allMarkers),
                myLocationEnabled: true,
              )
          ),

          SizedBox(height: 10,),
          Container(
            alignment: Alignment.center,
            color: Colors.deepOrangeAccent,
            child: Text(
              currentSearch,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            width: 300,
            height: 50,
          )
        ]
    );

  }

  Function toDetailPage(placeId){
    debugPrint(placeId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
        placeId: placeId,
        googlePlace: googlePlace,
        ),
      ),
    );
    return toDetailPage;
  }

  void _onePointMark(){
    setState(() {
      currentSearch = chosenTag;
      allMarkers.removeRange(0, allMarkers.length);
      allMarkers.add(Marker(
          markerId: MarkerId('convenience'),
          draggable: false,
          infoWindow: InfoWindow(
              title: "place.name1"
          ),
          onTap: (){},
          position: LatLng(Edit.selectedPlace.geometry.location.lat,Edit.selectedPlace.geometry.location.lng)
      )
      );
    });
  }

  void _placeMark(){
    print("1111111111111111");
    print(this.chosenTag);
    setState(() {
      currentSearch = chosenTag;
      allMarkers.removeRange(0, allMarkers.length);
      print(place.name1[0]);
      allMarkers.add(Marker(
          markerId: MarkerId('convenience'),
          draggable: false,
          infoWindow: InfoWindow(
              title: place.name1
          ),
          onTap: (){
            debugPrint(place.placeId1);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  placeId: place.placeId1,
                  googlePlace: googlePlace,
                ),
              ),
            );
          },
          position: LatLng(place.geometry1["location"]["lat"],place.geometry1["location"]["lng"])
      )
      );
      allMarkers.add(Marker(
          markerId: MarkerId('convenience2'),
          draggable: false,
          infoWindow: InfoWindow(
              title: place.name2
          ),
          onTap: (){
            debugPrint(place.placeId2);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  placeId: place.placeId2,
                  googlePlace: googlePlace,
                ),
              ),
            );
          },
          position: LatLng(place.geometry2["location"]["lat"],place.geometry2["location"]["lng"])
      )
      );
      allMarkers.add(Marker(
          markerId: MarkerId('convenience3'),
          draggable: false,
          infoWindow: InfoWindow(
              title: place.name3
          ),
          onTap: (){
            debugPrint(place.placeId3);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  placeId: place.placeId3,
                  googlePlace: googlePlace,
                ),
              ),
            );
          },
          position: LatLng(place.geometry3["location"]["lat"],place.geometry3["location"]["lng"])
      )
      );
    });

  }

  void getTagContext(Map tags){
    tags.forEach((key, value) {
      if(value)
        this.chosenTag = key;
    });
  }

  onNotificationInLowerVersions(ReceivedNotification receivedNotification) {
    print('Notification Received ${receivedNotification.id}');
  }

  // 通知クリック後の操作．NotificationScreenに移動する
  onNotificationClick(String payload) {
    print('Payload $payload');
    Navigator.push(context, MaterialPageRoute(builder: (coontext) {
      return NotificationScreen(
        payload: payload,
      );
    }));
  }
  var EARTH_RADIUS = 6378.137;


  double getDistance(lng1, lat1, lng2, lat2) {
    double radLat1 = lat1 * 3.1415926 / 180.0;
    double radLat2 = lat2 * 3.1415926 / 180.0;
    double radLng1 = lng1 * 3.1415926 / 180.0;
    double radLng2 = lng2 * 3.1415926 / 180.0;
    double a = radLat1 - radLat2;
    double b = radLng1 - radLng2;
    double d =  acos(sin(radLat1)*sin(radLat2)+cos(radLat1)*cos(radLat2)*cos(radLng2-radLng1))*EARTH_RADIUS;
    return d*1000.0;
  }

}