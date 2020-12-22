import 'package:flutter/cupertino.dart';

class MyNavigatorObservers extends NavigatorObserver {
  //when use Navigator.push
  @override
  void didPush(Route route, Route previousRoute) {
    // TODO: implement didPush
    super.didPush(route, previousRoute);
    if (route != Null) {
      print("didpush route settings is " + route.settings.toString());
      print("didpush route settings.name is " + route.settings.name.toString());
    }

    if (previousRoute != Null) {
      print("didpush previous route settings is " +
          previousRoute.settings.toString());
      print("didpush previous route settings.name is " +
          previousRoute.settings.name.toString());
    }
  }
//when use Navigator.pop
  @override
  void didPop(Route route, Route previousRoute) {
    // TODO: implement didPop
    super.didPop(route, previousRoute);
    if (route != Null) {
      print("didpop route settings is " + route.settings.toString());
      print("didpop route settings.name is " + route.settings.name.toString());
    }

    if (previousRoute != Null) {
      print("didpop previous route settings is " +
          previousRoute.settings.toString());
      print("didpop previous route settings.name is " +
          previousRoute.settings.name.toString());
    }
  }
  //when use Navigator.remove
  @override
  void didRemove(Route route, Route previousRoute) {
    // TODO: implement didRemove
    super.didRemove(route, previousRoute);

  }
}
