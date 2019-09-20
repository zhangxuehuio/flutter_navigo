import 'package:flutter/material.dart';

class PageRouteManager {
  static MaterialPageRoute getMaterialPageRoute(Widget widget) {
    return MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return widget;
        });
  }

  static PageRouteManager _instance;
  Map<String, WidgetBuilder> totalRoutes = <String, WidgetBuilder>{};

  factory PageRouteManager() => _getInstance();

  static PageRouteManager _getInstance() {
    if (_instance == null) {
      _instance = PageRouteManager._();
    }
    return _instance;
  }

  PageRouteManager._();

  void addRoute(String name, Widget widget) {
    totalRoutes[name] = (BuildContext context) => widget;
  }

  void findRouteByName(String name) {
    WidgetBuilder  widgetBuilder = totalRoutes[name];
    if(widgetBuilder==null){

    }
  }

//  static PageRouteManager of(
//      BuildContext context, {
//        bool rootNavigator = false,
//        bool nullOk = false,
//      }) {
//    final PageRouteManager manager = PageRouteManager(context);
//    return navigator;
//  }

}
