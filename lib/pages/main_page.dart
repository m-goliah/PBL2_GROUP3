import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'All_Item_Page.dart';
import 'finish_Item_page.dart';
import 'Today_item_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  //bottom bar page number
  num _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    TodayItemPage(),
    AllItemPage(),
    FinishItemPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          //leading: Icon(Icons.menu),
          title: Center(
            child: Text("LOCReminder"),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              tooltip: "add a new list",
              onPressed: () {
                Navigator.of(context).pushNamed("/newlist");
              },
            )
          ]),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              children: <Widget>[
                _widgetOptions.elementAt(_selectedIndex),
                //   FlatButton(
                //     child: Text("open drawer"),
                //     onPressed: () {
                //     //open left drawer
                //       Scaffold.of(context).openDrawer();
                //   },
                // )
              ],
            ),
          );
        },
      ),
      drawer: Container(
          color: Colors.cyan[700],
          width: 150,
          height: 700,
          padding: EdgeInsets.symmetric(vertical: 80),
          //linear conlum button in drawer.
          child: Column(
            children: <Widget>[
              MaterialButton(
                  child: Text("account"),
                  color: Colors.white,
                  onPressed: () {print("check account");}),
              MaterialButton(
                  child: Text("settings"),
                  color: Colors.white,
                  onPressed: (){print("set settings");}),
              MaterialButton(
                  child: Text("theme"),
                  color: Colors.white,
                  onPressed: (){print("change theme");}),

              MaterialButton(
                  child: Text("VIP"),
                  color: Colors.white,
                  onPressed: (){print("charge VIP");}),
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          //parameter1  icon
          BottomNavigationBarItem(icon: Icon(Icons.today), label: "today"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "All"),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle), label: "finished"),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.cyan[700],
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
