
import 'package:flutter/material.dart';

class PageRouteManager{

 static MaterialPageRoute getMaterialPageRoute(Widget widget){
    return MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return widget;
        });
  }
}