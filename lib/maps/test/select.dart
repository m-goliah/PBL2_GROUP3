import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
//import 'keys.dart';
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application. 
//   @override
//   Widget build(BuildContext context) {
//     // 加导航，放入materialApp组件   
//     return MaterialApp(
//       home: Scaffold(appBar: AppBar(title: Text('LocReminder'),), body: HomeContent(),),
//       theme: ThemeData(primarySwatch: Colors.yellow,),
//     );
//   }
// }

class HomeContent extends StatefulWidget {
  const HomeContent({Key key}) : super(key: key);
  //初始坐标 
  static final _kGooglePlex = LatLng(33.57442265069955, 130.2474225493839);
  @override
  State<StatefulWidget> createState()=>MapSampleState();
}
class MapSampleState extends State<HomeContent> {
  PickResult selectedPlace;
  Completer<GoogleMapController> _controller = Completer();
  void _onMapCreated(GoogleMapController controller) {_controller.complete(controller);}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text("Load Google Map"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                      return PlacePicker(
                          apiKey: 'AIzaSyABKBCqeZAXZ6f_HTWSO5JwJ74hW0k4tAU',
                          initialPosition: HomeContent._kGooglePlex,
                          useCurrentLocation: true,
                          selectInitialPosition: true,
                          onPlacePicked: (result) {
                            selectedPlace = result;

                            Navigator.of(context).pop();
                            setState(() {});
                              },
  );
}));
}),
              selectedPlace == null ? Container() : Text(selectedPlace.geometry.location.lat.toString() +','+ selectedPlace.geometry.location.lat.toString() ?? ""),
            ],
            )
        ),
      );
  }
}