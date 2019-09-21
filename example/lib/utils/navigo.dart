import 'package:flutter/material.dart';

class Navigo {
  /// pop并返回参数
  /// popAndPushNamed关闭当前页面，并通过名字跳转到新的页面。不论栈中是否存在。
  /// popUtil关闭当前页面，并跳转到栈中对应名字的页面。名字不存在，会导致异常。
  @protected
  static Future<dynamic> pop<T extends Object>(BuildContext context,
      {RouteInterceptor interceptor, T result}) {
    assert(context != null);
    if (interceptor == null) {
      Navigator.of(context).pop();
      return Future.value(true);
    }
    return interceptor.intercept(context, result);
  }

  /// pop并返回参数
  /// popAndPushNamed关闭当前页面，并通过名字跳转到新的页面。不论栈中是否存在。
  /// popUtil关闭当前页面，并跳转到栈中对应名字的页面。名字不存在，会导致异常。
  @protected
  static Future<dynamic> popUtil<T extends Object>(BuildContext context,
      {RouteInterceptor interceptor, T result}) {
    assert(context != null);
    if (interceptor == null) {
      Navigator.of(context).pop();
      return Future.value(true);
    }
    return interceptor.intercept(context, result);
  }
}

///页面pop拦截器
class RouteInterceptor {
  @mustCallSuper
  @protected
  Future<dynamic> intercept<T extends Object>(BuildContext context, T result) {
    return Future.value(false);
  }
}

///af页面pop拦截器
class AdPopRouteInterceptor implements RouteInterceptor {
  AdPopRouteInterceptor();

  @override
  Future<dynamic> intercept<T extends Object>(BuildContext context, T result) {
    /// 关闭并跳转到广告页
//    if (result != null) {
//      return Navigator.of(context)
//          .popAndPushNamed(AdTestPage.routeName, result: result);
//    } else {
//      return Navigator.of(context).popAndPushNamed(AdTestPage.routeName);
//    }
//    SplashAdProvider.instance.load();
//    SplashAdProvider.instance.show();

    /// 关闭广告页，跳回当前页
    return Future.value(true);
  }
}
