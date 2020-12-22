import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewListPageState();
  }
}

class NewListPageState extends State<NewListPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading:
          IconButton(
            icon:Icon(Icons.cancel),
            onPressed: () {
              Navigator.of(context).pushNamed("/main");
            },
          ),
          title: Center(
            child: Text("NewList"),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              tooltip: "ok",
              onPressed: () {
                Navigator.of(context).pushNamed("/main");
              },
            )
          ]),
      body: Column(children: <Widget>[
        FlatButton(
          child: Text("Pick time"),
          onPressed: () {
            Navigator.of(context).pushNamed("/picktime");
          },
        ),
        FlatButton(
          child: Text("pick location"),
          onPressed: () {
            Navigator.of(context).pushNamed("/picklocation");
          },
        )
      ]),
    );
  }
}
