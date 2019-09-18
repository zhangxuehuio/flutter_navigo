import 'package:flutter/material.dart';
import 'package:flutter_navigo_example/flutter_api_base_page.dart';

class FlutterApiPage extends StatefulWidget {
  @override
  _FlutterApiPageState createState() => _FlutterApiPageState();
}

class _FlutterApiPageState extends State<FlutterApiPage> {
  String pageName = 'FlutterApiPage';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter api'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildItem(
                  "简单使用",
                  "    Flutter路由，即Widget page的跳转、返回、移除和替换等。"
                      "\n    理论上flutter可以从当前页面，跳转到任意类型为Widget的页面。"
                      "\n    如：整个页面切换，或整个页面中某一个子Widget的切换。在路由中，可以整理为以下两大类："
                      "\n      1.通过route类，进行跳转"
                      "\n      2.通过名字跳转",
                      (context) {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FlutterApiBasePage()));
                  }),
              _buildItem(
                  "参数传递",
                  "    在页面跳转过程中，我们经常需要从一个页面向另一个页面传值。"
                      "\n    针对flutter路由，参数的传值可以分为以下几种形式："
                      "\n    1.命名路由传参（构造方法）"
                      "\n    2.非命名路由传参（object）"
                      "\n    3.页面pop传参",
                      (context) {}),
              _buildItem(
                  "跳转动画",
                  "    页面切换时显示的动画，如：淡入淡出、平移等动画。"
                      "\n    动画共有以下几种形式："
                      "\n    1.官方提供的兼容性动画"
                      "\n    2.自定义动画",
                      (context) {}),
              _buildItem(
                  "跳转拦截",
                  "    在页面跳转工程中，可能会需要，类似登录检测、插入广告、异常处理等操作。"
                      "\n    官方提供以下几种形式："
                      "\n    1.本地拦截"
                      "\n    2.全局拦截",
                      (context) {}),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "本APP中的文字内容，仅为个人理解所写。\n如有错误，欢迎指正。",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildItem(String title, String desc,
      Function(BuildContext context) callback) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Color(0xFFFEFEFE), width: 1),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GestureDetector(
        onTap: () {
          callback(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(9),
                      topRight: Radius.circular(9)),
                  border: Border.all(color: Color(0xFFFEFEFE), width: 2)
              ),
              padding: EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xBB000000),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xBB000000),
                    size: 20,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                desc,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0x99000000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
