import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/NewList_page.dart';
import '../pages/PickLocation.dart';
import '../pages/PickTime.dart';
import '../pages/error_page.dart';
import '../pages/main_page.dart';
import '../pages/repeat_page.dart';

///start routes
void main()=>runApp(RoutesAPP());

///define root content
class RoutesAPP extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      ///deploy routes
      routes:{
        "/main":(BuildContext context)=>MainPage(),
        "/newlist":(BuildContext context)=>NewListPage(),
        "/picktime":(BuildContext context)=>PickTimePage(),
        "/picklocation":(BuildContext context)=>PickLocationPage(),
        "/repeat":(BuildContext context)=>RepeatPage(),
      },
      initialRoute: "/main",
      onGenerateRoute: (RouteSettings settings){
        return new MaterialPageRoute(
            builder: (BuildContext context)=>ErrorPage());
      },
      //monitor all pages
      theme: ThemeData(
        //配置应用程序亮色暗色，
        brightness: Brightness.light,
        //应用程序主背景色
        primaryColor: Colors.cyan[800],
        //导航栏，浮动按钮的背景色color of bar and float button
        primarySwatch: Colors.blue,
        //前景色,进度条前景色开关switch选中的颜色，单选框Ratio选项选中时颜色，文本输入框
        accentColor: Colors.cyan[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          //
          color: Colors.cyan[800],
            //阴影高度shadow height
            elevation: 10.0,
          iconTheme: IconThemeData(
            //图标颜色
            color: Colors.white,
            //图标大小
            size: 24
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,

          )
        ),
      ),
   );
  }

}