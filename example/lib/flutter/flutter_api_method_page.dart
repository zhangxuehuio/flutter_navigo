import 'package:flutter/material.dart';
import 'package:flutter_navigo_example/flutter/flutter_api_model.dart';
import 'package:flutter_navigo_example/widget/common_app_bar.dart';
import 'package:flutter_navigo_example/widget/config.dart';
import 'package:flutter_navigo_example/widget/web_browser.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterApiMethodPage extends StatefulWidget {
  static final String routeName = '/flutter/method';

  ApiItem apiItem;

  FlutterApiMethodPage({this.apiItem});

  @override
  _FlutterApiMethodPageState createState() => _FlutterApiMethodPageState();
}

class _FlutterApiMethodPageState extends State<FlutterApiMethodPage>
    with SingleTickerProviderStateMixin {
  String _pageName = 'FlutterApiMethodPage';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: CommonAppBar('api详解'),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  widget.apiItem.method,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.blueGrey,
              ),
              getTitle("参数详解："),
              Column(
                children: List<Widget>.generate(widget.apiItem.params.length,
                    (index) {
                  return Row(
                    children: <Widget>[
                      Text(
                        widget.apiItem.params[index].name + ":   ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        widget.apiItem.params[index].desc,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Text("官方地址："),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => WebBrowser(
                                  widget.apiItem.apiLink,
                                  widget.apiItem.method)));
                    },
                    child: Text(
                      "去查看官方API",
                      style: TextStyle(
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              getTitle("理解："),
              Container(
                height: 1,
                color: Colors.blueGrey,
              ),
              getDesc(widget.apiItem.myDesc),
              getTitle("演示代码："),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffeeeeee),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: EdgeInsets.only(bottom: 10),
                child: getDesc(widget.apiItem.example),
              ),
              getTitle("代码解析："),
              Container(
                height: 1,
                color: Colors.blueGrey,
              ),
              getDesc(widget.apiItem.exampleDesc),
              GestureDetector(
                onTap: () {
                  String methodName = widget.apiItem.method;
                  if (methodName.endsWith("canPop")) {
                    Config.popModel = 1;
                    Fluttertoast.showToast(
                        msg: "已开启，canPop模式，点击标题返回按钮，先进行canPop检查。");
                  } else if (methodName.endsWith("maybePop")) {
                    Config.popModel = 2;
                    Fluttertoast.showToast(
                        msg: "已开启，canPop模式，点击标题返回按钮，先进行canPop检查。");
                  } else if (methodName.endsWith("pop")) {
                    Navigator.pop(context);
                  } else if (methodName.endsWith("popAndPushNamed")) {
                    Navigator.popAndPushNamed(context, "");
                  } else if (methodName.endsWith("popUntil")) {
                  } else if (methodName.endsWith("push")) {
                  } else if (methodName.endsWith("pushAndRemoveUntil")) {
                  } else if (methodName.endsWith("pushNamed")) {
                  } else if (methodName.endsWith("pushNamedAndRemoveUntil")) {
                  } else if (methodName.endsWith("pushReplacement")) {
                  } else if (methodName.endsWith("pushReplacementNamed")) {
                  } else if (methodName.endsWith("removeRoute")) {
                  } else if (methodName.endsWith("removeRouteBelow(")) {
                  } else if (methodName.endsWith("replace")) {
                  } else if (methodName.endsWith("replaceRouteBelow")) {}
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.blue,
                  ),
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Text(
                    "运行",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle getTitleTextStyle() {
    return TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87);
  }

  Container getTitle(String str) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        str,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  Container getDesc(String str) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(10),
      child: Text(
        str,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Color(0xff555555)),
      ),
    );
  }
}
