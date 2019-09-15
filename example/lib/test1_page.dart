import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_navigo_example/page_route_manager.dart';
import 'package:flutter_navigo_example/test2_page.dart';

class Test1Model {
  bool isOnTap = false;
  bool isName = false;
  Test1Model({this.isOnTap = false,this.isName = false});
}

class Test1Page extends StatefulWidget {
  static const String pageName = 'Test1Page';

  bool isOnTap = false;
  bool isName = false;
  Test1Model test1model;

  Test1Page({this.test1model}){
    if(test1model==null) {
      this.test1model = Test1Model();
    }
  }

  @override
  _Test1PageState createState() => _Test1PageState();
}

class _Test1PageState extends State<Test1Page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _pageName = Test1Page.pageName;
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
              widget.isOnTap?GestureDetector(
                onTap: () {
                   if(!widget.isName) {
                     Navigator.of(context).pushAndRemoveUntil(
                       PageRouteManager.getMaterialPageRoute(Test1Page()),
                       ModalRoute.withName(_pageName),
                     );
                   }else{
                     Navigator.of(context).pushNamedAndRemoveUntil(
                       Test2Page.pageName,
                       ModalRoute.withName(_pageName),
                       arguments: "我是$_pageName页传递过来的参数"
                     );
                   }
                },
                child: Container(
                  child: Text(!widget.isName?"正常跳转到下一页":"通过名称跳转到下一页"),
                ),
              ):Container(),
            ],
          )),
    );
  }
}
