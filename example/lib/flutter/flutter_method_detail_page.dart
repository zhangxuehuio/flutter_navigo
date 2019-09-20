import 'package:flutter/material.dart';
import 'package:flutter_navigo_example/test1_page.dart';
import 'package:flutter_navigo_example/test2_page.dart';
import 'package:flutter_navigo_example/utils/page_route_manager.dart';


class FlutterMethodDetailPage extends StatefulWidget {
  @override
  _FlutterMethodDetailPageState createState() => _FlutterMethodDetailPageState();
}

class _FlutterMethodDetailPageState extends State<FlutterMethodDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}
/// 方法名称
/// 参数列表
/// 官方api
/// 理解
/// 示例
/// 解析
/// 跳转方法
class MethodDetailModel {
  String name;
  String desc;

  GestureTapCallback onTap;

  MethodDetailModel(this.name, this.desc, this.onTap);
}