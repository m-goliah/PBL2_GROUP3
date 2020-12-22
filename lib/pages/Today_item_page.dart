
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodayItemPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TodayItemPageState();

  }
}

class TodayItemPageState extends State<TodayItemPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Center(
     // child: SizedBox(
     //   width: 400,
     //   height: 20,
     //set container
       child: Container(
         width: 400,
         height: 45,
         padding: EdgeInsets.all(10),

         //set decoration of container
         decoration: BoxDecoration(
           color: Colors.blueAccent[100],
           border: new Border.all(
             color: Colors.grey,
             width: 1.0,
             style: BorderStyle.solid,
           ), 
             //borderRadius: BorderRadius.vertical(top: Radius.elliptical(20, 20 ),bottom: Radius.elliptical(30, 30))
             //borderRadius: BorderRadius.only(topLeft: Radius.elliptical(20, 20),bottomRight: Radius.elliptical(30, 30))
           borderRadius: BorderRadius.circular(5.0)

         ),
         child: Text(
           "pay for the electricity fee and see one of my friends",
           style:TextStyle(
             //set text style
             fontSize: 18.0,
             decoration: TextDecoration.none,
           ),
           //line must be 1 rows
           maxLines: 1,
           //remained text will be replaced by ...
           overflow: TextOverflow.ellipsis,
           textAlign: TextAlign.left,
         ),

       ),

   );

  }
}