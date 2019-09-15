
import 'package:flutter/material.dart';

class Test1Page extends StatefulWidget {
  @override
  _Test1PageState createState() => _Test1PageState();
}

class _Test1PageState extends State<Test1Page> {
  String _pageName = 'Test1Page';

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text('Running on: $_pageName\n'),
            ),
            GestureDetector(
              onTap: (){

              },
              child:Container(
                child: Text(
                  "跳转到下一页"
                ),
              ) ,
            )
          ],

        )
      ),
    );
  }
}