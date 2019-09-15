import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_navigo_example/page_route_manager.dart';

class Test2Page extends StatefulWidget {
  static const String pageName = 'Test2Page';

  @override
  _Test2PageState createState() => _Test2PageState();
}

class _Test2PageState extends State<Test2Page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _pageName = Test2Page.pageName;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Column(
            children: <Widget>[
              Center(
                child: Text('当前显示的页面是：$_pageName \n'),
              ),
            ],
          )),
    );
  }
}
