import 'package:flutter/material.dart';

import 'page_route_manager.dart';

class Navigo {
  BuildContext context;

  Navigo(this.context) {}

  static Navigo of(BuildContext context, {
    bool rootNavigator = false,
    bool nullOk = false,
  }) {
    final Navigo navigo = Navigo(context);
    assert(() {
      if (navigo == null) {
        throw FlutterError(
            'Navigator operation requested with a context that does not include a Navigator.\n'
                'The context used to push or pop routes from the Navigator must be that of a '
                'widget that is a descendant of a Navigator widget.');
      }
      return true;
    }());
    return navigo;
  }

  Future push(Widget target) {
    return Navigator.of(context)
        .push(PageRouteManager.getMaterialPageRoute(target));
  }
/// pop并返回参数
/// pop通过名字
  Future<dynamic> pop<T extends Object>(
  {BuildContext context, RouteInterceptor interceptor,T result}) {
    Navigator.pop(context);
  }
}

class RouteInterceptor extends NavigatorObserver {
  NavigatorState get navigator => _navigator;
  NavigatorState _navigator;

  ///准备push到新的页面
  void readyPush(Route<dynamic> route, Route<dynamic> previousRoute) {}

  ///转变pop
  void readyPop(Route<dynamic> route, Route<dynamic> previousRoute) {}
}
