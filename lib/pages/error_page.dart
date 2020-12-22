import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return ErrorPageState();
  }
}
class ErrorPageState extends State<ErrorPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("404"),
      ),
      body: Center(
        child: Text("can't find the page"),
      ),
    );
  }
}