import 'package:flutter/material.dart';

import 'page_route_manager.dart';

class Navigo {
  BuildContext context;

  Navigo(this.context) {
  }

  static Navigo of(
    BuildContext context, {
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
    return Navigator.of(context).push(PageRouteManager.getMaterialPageRoute(target));
  }
}
