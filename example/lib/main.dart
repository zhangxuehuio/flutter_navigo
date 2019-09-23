import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_navigo/flutter_navigo.dart';
import 'package:flutter_navigo_example/flutter/flutter_api_list_page.dart';
import 'package:flutter_navigo_example/flutter/flutter_api_method_page.dart';
import 'package:flutter_navigo_example/flutter/flutter_api_page.dart';
import 'package:flutter_navigo_example/flutter/flutter_method_detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _currentIndex = 0;
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterNavigo.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white70,
        body: _currentIndex == 0 ? Container() : FlutterApiPage(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black54,
          selectedItemColor: Color(0xff1296db),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/navigo_api.png",
                width: 28,
                height: 28,
                color: _currentIndex == 0 ? Color(0xff1296db) : Colors.black54,
              ),
              title: Text(
                'Navigo',
                style: TextStyle(
                  color:
                      _currentIndex == 0 ? Color(0xff1296db) : Colors.black54,
                  fontSize: 14,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/flutter_api.png",
                width: 26,
                height: 26,
                color: _currentIndex == 1 ? Color(0xff1296db) : Colors.black54,
              ),
              title: Text(
                'Flutter',
                style: TextStyle(
                  color:
                      _currentIndex == 1 ? Color(0xff1296db) : Colors.black54,
                  fontSize: 14,
                ),
              ),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(
              () {
                _currentIndex = index;
              },
            );
          },

        ),
      ),
      routes: <String, WidgetBuilder> {
        FlutterApiPage.routeName : (BuildContext context) => FlutterApiPage(),
        FlutterApiListPage.routeName: (BuildContext context) => FlutterApiListPage(),
        FlutterApiMethodPage.routeName: (BuildContext context) => FlutterApiMethodPage(),
      },
    );
  }
}
