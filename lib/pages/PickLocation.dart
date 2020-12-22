import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickLocationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return PickLocationPageState();
  }
}

class PickLocationPageState extends State<PickLocationPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            Navigator.of(context).pushNamed("/newlist");
          },
        ),
        title: Center(
          child: Text("PickLocation"),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            tooltip: "ok",
            onPressed: () {
              Navigator.of(context).pushNamed("/newlist");
            },
          )
        ],
      ),
      body: Center(
      ),
    );
  }
}