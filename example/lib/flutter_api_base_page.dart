import 'package:flutter/material.dart';
import 'package:flutter_navigo_example/page_route_manager.dart';
import 'package:flutter_navigo_example/test2_page.dart';

import 'test1_page.dart';

class FlutterApiBasePage extends StatefulWidget {
  @override
  _FlutterApiBasePageState createState() => _FlutterApiBasePageState();
}

class _FlutterApiBasePageState extends State<FlutterApiBasePage>
    with SingleTickerProviderStateMixin {
  String _pageName = 'FlutterApiPage';

  List<ApiModel> list = [];
  Animation animation;
  AnimationController animationController;
  Color iconColors = Color(0xBB000000);

  @override
  void initState() {
    super.initState();
    list = <ApiModel>[
      ApiModel("跳转", "", () {}),
      ApiModel("push", "将给定路径推送到最紧密包围给定上下文的导航器.", () {
        Navigator.of(context)
            .push(PageRouteManager.getMaterialPageRoute(Test1Page()));
      }),
      ApiModel("pushAndRemoveUntil",
          "将给定路由推送到最紧密包围给定上下文的导航器，然后删除所有先前路由，直到 predicate返回true。", () {
        Navigator.of(context)
            .push(PageRouteManager.getMaterialPageRoute(Test1Page(
          test1model: Test1Model(isOnTap: true, isName: false),
        )));
      }),
      ApiModel("pushNamed", "将命名路由推送到最紧密包围给定上下文的导航器。", () {
        Navigator.of(context).pushNamed(Test1Page.pageName);
      }),
      ApiModel("pushNamedAndRemoveUntil ",
          "将具有给定名称的路由推送到最紧密包围给定上下文的导航器，然后删除所有先前的路由，直到predicate返回true。", () {
        Navigator.of(context).pushNamed(Test1Page.pageName,
            arguments: Test1Model(isOnTap: true, isName: true));
      }),
      ApiModel("pushReplacement ",
          "通过推送给定路线，然后在新路线完成动画制作后处置前一路线，替换最紧密包围给定上下文的导航器的当前路线。", () {
        Navigator.of(context).pushReplacement(
            PageRouteManager.getMaterialPageRoute(Test1Page()));
      }),
      ApiModel("pushReplacementNamed ",
          "通过按下命名的路径替换最紧密包围给定上下文的导航器的当前路由，routeName然后在新路由完成动画后处理前一路由。", () {
        Navigator.of(context).pushReplacementNamed(Test1Page.pageName);
      }),
      ApiModel("返回", "", () {}),
      ApiModel("pop", "弹出最紧密围绕给定上下文的导航器中的最顶层路径。", () {
        Navigator.of(context).pop();
      }),
      ApiModel("popAndPushNamed", "弹出导航器上的当前路径，该导航器最紧密地包围给定的上下文并在其位置推送命名路径。",
          () {
        Navigator.of(context).popAndPushNamed(Test1Page.pageName);
      }),
      ApiModel("popUntil", "来电弹出反复上最紧密围绕给定的情况下，直到谓词返回true导航。", () {
        Navigator.of(context).popUntil(ModalRoute.withName(_pageName));
      }),
      ApiModel("移除", "", () {}),
      ApiModel("removeRoute", "来立即route从最紧密包围给定上下文的导航器中删除，并路由它。", () {
        Navigator.of(context)
            .removeRoute(PageRouteManager.getMaterialPageRoute(Test1Page()));
      }),
      ApiModel("removeRouteBelow",
          "立即从导航器中删除最紧密包含给定上下文的路由，然后路由它。要替换的路线是给定的路线anchorRoute。。", () {
        Navigator.of(context).removeRouteBelow(
            PageRouteManager.getMaterialPageRoute(Test1Page()));
      }),
      ApiModel("替换", "", () {}),
      ApiModel("replace", "将导航器上的路径替换为使用新路径最紧密地包围给定上下文的路径。", () {
        Navigator.of(context).replace(
          oldRoute: PageRouteManager.getMaterialPageRoute(Test1Page()),
          newRoute: PageRouteManager.getMaterialPageRoute(Test2Page()),
        );
      }),
      ApiModel("replaceRouteBelow",
          "将导航器上的路径替换为使用新路径最紧密地包围给定上下文的路径。要替换的路线是给定的路线anchorRoute。", () {
        Navigator.of(context).replaceRouteBelow(
          anchorRoute: PageRouteManager.getMaterialPageRoute(Test1Page()),
          newRoute: PageRouteManager.getMaterialPageRoute(Test2Page()),
        );
      }),
      ApiModel("返回判断", "", () {}),
      ApiModel("canPop", "是否可以弹出最紧密包围给定上下文的导航器。", () {
        Navigator.of(context).canPop();
      }),
      ApiModel("maybePop", "返回最紧密包围给定上下文的导航器的当前路由的Route.willPop方法的值。", () {
        Navigator.of(context).maybePop();
      }),
    ];
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    animation = new Tween(begin: 0.0, end: 0.25).animate(animationController);
  }

  _changeOpacity(bool expand) {
    setState(() {
      if (expand) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        centerTitle: true,
        title: const Text('简单使用'),
      ),
      body: ListView(
        children: <Widget>[
          _buildItem("","",(c){}),
          /// (title: Text('第一列')),
//          ExpansionTile(
//            title: const Text('通过Route跳转'),
//            backgroundColor: Colors.white,
//            trailing: RotationTransition(
//              turns: animation,
//              child: Icon(
//                Icons.chevron_right,
//                color: iconColors,
//              ),
//            ),
//            onExpansionChanged: (bool) {
//              _changeOpacity(bool);
//            },
//            children: const <Widget>[
//              ListTile(title: Text('One')),
//              ListTile(title: Text('Two')),
//              ListTile(title: Text('Free')),
//              ListTile(title: Text('Four'))
//            ],
//          ),
//          const ListTile(title: Text('第三列')),
        ],
      ),
    );
  }

  _buildItem(
      String title, String desc, Function(BuildContext context) callback) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Color(0xFFFEFEFE), width: 1),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child:ExpansionTile(
        title: Container(
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
//        Text('通过Route跳转'),
        backgroundColor: Colors.white,
        trailing: RotationTransition(
          turns: animation,
          child: Icon(
            Icons.chevron_right,
            color: iconColors,
          ),
        ),
        onExpansionChanged: (bool) {
          _changeOpacity(bool);
        },
        children: const <Widget>[
          ListTile(title: Text('One')),
          ListTile(title: Text('Two')),
          ListTile(title: Text('Free')),
          ListTile(title: Text('Four'))
        ],
      ),
    );
  }
}

class ApiModel {
  String name;
  String desc;

  GestureTapCallback onTap;

  ApiModel(this.name, this.desc, this.onTap);
}

//ListView.separated(
//            itemCount: 25,
//            separatorBuilder: (BuildContext context, int index) {
//              return Divider(
//                color: Colors.transparent,
//                height: 10,
//              );
//            },
//            itemBuilder: (BuildContext context, int index) {
//              ApiModel model = list[index];
//              return Container(
//                margin: EdgeInsets.symmetric(horizontal: 15),
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(Radius.circular(5)),
//                  color: Colors.white,
//                ),
//                child: GestureDetector(
//                  onTap: model.onTap,
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    mainAxisSize: MainAxisSize.max,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      Column(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          Text(
//                            model.name,
//                            style: TextStyle(
//                              fontSize: 16,
//                              fontWeight: FontWeight.bold,
//                              color: Colors.black,
//                            ),
//                            textAlign: TextAlign.left,
//                          ),
//                          Text(
//                            model.desc,
//                            style: TextStyle(
//                              fontSize: 14,
//                              fontWeight: FontWeight.normal,
//                              color: Colors.black45,
//                            ),
//                            textAlign: TextAlign.left,
//                          ),
//                        ],
//                      ),
//                      Icon(
//                        Icons.arrow_forward_ios,
//                      )
//                    ],
//                  ),
//                ),
//              );
//            },
//          )),
