import 'package:flutter/material.dart';
import 'package:flutter_navigo_example/page_route_manager.dart';
import 'package:flutter_navigo_example/test2_page.dart';

import 'test1_page.dart';

class FlutterApiPage extends StatefulWidget {
  @override
  _FlutterApiPageState createState() => _FlutterApiPageState();
}

class _FlutterApiPageState extends State<FlutterApiPage> {
  String _pageName = 'FlutterApiPage';

  List<ApiModel> list = [];


  @override
  void initState() {
    super.initState();
    list = <ApiModel>[
      ApiModel("跳转", "", () {}),
      ApiModel("push",
          "将给定路径推送到最紧密包围给定上下文的导航器.",
              () {
            Navigator.of(context).push(
                PageRouteManager.getMaterialPageRoute(Test1Page()));
          }),
      ApiModel("pushAndRemoveUntil",
          "将给定路由推送到最紧密包围给定上下文的导航器，然后删除所有先前路由，直到 predicate返回true。",
              () {
            Navigator.of(context).push(PageRouteManager.getMaterialPageRoute(
                Test1Page(
                  test1model: Test1Model(isOnTap: true, isName: false),)));
          }),
      ApiModel("pushNamed",
          "将命名路由推送到最紧密包围给定上下文的导航器。",
              () {
            Navigator.of(context).pushNamed(Test1Page.pageName);
          }),
      ApiModel("pushNamedAndRemoveUntil ",
          "将具有给定名称的路由推送到最紧密包围给定上下文的导航器，然后删除所有先前的路由，直到predicate返回true。",
              () {
            Navigator.of(context).pushNamed(Test1Page.pageName,
                arguments: Test1Model(isOnTap: true, isName: true));
          }),
      ApiModel("pushReplacement ",
          "通过推送给定路线，然后在新路线完成动画制作后处置前一路线，替换最紧密包围给定上下文的导航器的当前路线。",
              () {
            Navigator.of(context).pushReplacement(
                PageRouteManager.getMaterialPageRoute(Test1Page()));
          }),
      ApiModel("pushReplacementNamed ",
          "通过按下命名的路径替换最紧密包围给定上下文的导航器的当前路由，routeName然后在新路由完成动画后处理前一路由。",
              () {
            Navigator.of(context).pushReplacementNamed(Test1Page.pageName);
          }),

      ApiModel("返回", "", () {}),
      ApiModel("pop",
          "弹出最紧密围绕给定上下文的导航器中的最顶层路径。",
              () {
            Navigator.of(context).pop();
          }),
      ApiModel("popAndPushNamed",
          "弹出导航器上的当前路径，该导航器最紧密地包围给定的上下文并在其位置推送命名路径。",
              () {
            Navigator.of(context).popAndPushNamed(Test1Page.pageName);
          }),
      ApiModel("popUntil",
          "来电弹出反复上最紧密围绕给定的情况下，直到谓词返回true导航。",
              () {
            Navigator.of(context).popUntil(ModalRoute.withName(_pageName));
          }),
      ApiModel("移除", "", () {}),
      ApiModel("removeRoute",
          "来立即route从最紧密包围给定上下文的导航器中删除，并路由它。",
              () {
            Navigator.of(context).removeRoute(
                PageRouteManager.getMaterialPageRoute(Test1Page()));
          }),
      ApiModel("removeRouteBelow",
          "立即从导航器中删除最紧密包含给定上下文的路由，然后路由它。要替换的路线是给定的路线anchorRoute。。",
              () {
            Navigator.of(context).removeRouteBelow(
                PageRouteManager.getMaterialPageRoute(Test1Page()));
          }),
      ApiModel("替换", "", () {}),
      ApiModel("replace",
          "将导航器上的路径替换为使用新路径最紧密地包围给定上下文的路径。",
              () {
            Navigator.of(context).replace(
              oldRoute: PageRouteManager.getMaterialPageRoute(Test1Page()),
              newRoute: PageRouteManager.getMaterialPageRoute(Test2Page()),
            );
          }),
      ApiModel("replaceRouteBelow",
          "将导航器上的路径替换为使用新路径最紧密地包围给定上下文的路径。要替换的路线是给定的路线anchorRoute。",
              () {
            Navigator.of(context).replaceRouteBelow(
              anchorRoute: PageRouteManager.getMaterialPageRoute(Test1Page()),
              newRoute: PageRouteManager.getMaterialPageRoute(Test2Page()),
            );
          }),
      ApiModel("返回判断", "", () {}),
      ApiModel("canPop",
          "是否可以弹出最紧密包围给定上下文的导航器。",
              () {
            Navigator.of(context).canPop();
          }),
      ApiModel("maybePop",
          "返回最紧密包围给定上下文的导航器的当前路由的Route.willPop方法的值。",
              () {
            Navigator.of(context).maybePop();
          }),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: ListView.separated(
            itemCount: 25,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              ApiModel model = list[index];
              return Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: GestureDetector(
                  onTap: model.onTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            model.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            model.desc,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black45,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                      )
                    ],
                  ),
                ),
              );
            },
          )
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
