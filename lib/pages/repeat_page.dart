import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RepeatPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return RepeatPageState();
  }
}

class RepeatPageState extends State<RepeatPage>{
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
          child: Text("Repeat"),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            tooltip: "ok",
            onPressed: () {
              Navigator.of(context).pushNamed("/picktime");
            },
          )
        ],
      ),
      body: Center(
      ),
    );
  }
}