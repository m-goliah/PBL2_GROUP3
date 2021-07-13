
import 'maps/mapPageWithButton.dart';
// import 'maps/mapPageTest.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
import 'maps/place.dart';
import 'maps/screenArguments.dart';
import 'memos/memoPage.dart';
import "alarm/LocalNotificationScreen.dart";
import 'alarm/NotificationOp.dart';
import 'maps/test/select.dart';
void main() => runApp(MyApp());




class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MemoList(),
    routes: {
        MyHomePage.routeName: (context) => MyHomePage(),
      },
    );
  }
}
