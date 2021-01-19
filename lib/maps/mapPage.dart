import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'placeSearch.dart';
import 'placeInfo.dart';



class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  Location _locationService = Location();
  List<Marker> allMarkers = [];
  PlaceSearch placeSearch;
  PlaceInfo placeInfo;
  // current location
  LocationData _yourLocation;

  // listen
  StreamSubscription _locationChangedListen;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5),(){
      placeSearch = PlaceSearch("convenience");
    });
    placeSearch.getPlaceIds();
    print(placeSearch.predictions[0].placeId);
    // Future.delayed(Duration(seconds: 5),(){
    //   placeInfo = PlaceInfo(placeSearch.placeIds[0],placeSearch.googlePlace);
    // });
    // Future.delayed(Duration(seconds: 5),(){
    //   placeInfo.getDetails(placeSearch.placeIds[0]);
    // });
    // print(placeInfo.detailsResult.geometry.toString());
    // placeSearch.search();
    // placeSearch.getPlaceIds();

    print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
    print(placeInfo.detailsResult.geometry.location.lat.toString());
    _getLocation();
    // Future.delayed(Duration(seconds: 5));


    _locationChangedListen =
        _locationService.onLocationChanged.listen((LocationData result) async {
          // placeSearch.getPlaceIds();
          // print(placeSearch.placeIds[0]);
          setState(() {
            _yourLocation = result;
            allMarkers.clear();
            allMarkers.add(Marker(
                markerId: MarkerId('myMarker'),
                draggable: false,
                onTap: () {
                  print('Marker Tapped');
                },
                position: LatLng(_yourLocation.latitude+0.0002, _yourLocation.longitude)
            ));

          });
          print(allMarkers.length);
        });
  }

  @override
  void dispose() {
    super.dispose();

    // listen finish
    _locationChangedListen?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RaisedButton(
        onPressed: (){
          placeSearch.getPlaceIds();
          print(placeSearch.placeIds[0]);
        },
      ),
      body: _makeGoogleMap(),
    );
  }

  Widget _makeGoogleMap() {
    if (_yourLocation == null) {
      // loading
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      // Map show
      return GoogleMap(

        // init camera position
        initialCameraPosition: CameraPosition(
          target: LatLng(_yourLocation.latitude, _yourLocation.longitude),
          zoom: 18.0,
        ),
        markers:Set.from(allMarkers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },

        // current position marker
        myLocationEnabled: true,
      );

    }
  }

  void _getLocation() async {
    _yourLocation = await _locationService.getLocation();
  }
}