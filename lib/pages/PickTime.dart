import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickTimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PickTimePageState();
  }
}

class PickTimePageState extends State<PickTimePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(
          child: Text("PickTime"),
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
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text("click to select repeat"),
            onPressed: () {
              Navigator.of(context).pushNamed("/repeat");
            },
          )
        ],
      ),
    );
  }
}
