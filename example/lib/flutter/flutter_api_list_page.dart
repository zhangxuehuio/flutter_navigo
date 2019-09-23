import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_navigo_example/flutter/flutter_api_method_page.dart';
import 'package:flutter_navigo_example/flutter/flutter_api_model.dart';
import 'package:flutter_navigo_example/widget/common_app_bar.dart';

class FlutterApiListPage extends StatefulWidget {
  static final String routeName = '/flutter/list';

  @override
  _FlutterApiListPageState createState() => _FlutterApiListPageState();
}

class _FlutterApiListPageState extends State<FlutterApiListPage>
    with SingleTickerProviderStateMixin {
  String _pageName = 'FlutterApiListPage';

  FlutterApiModel _mApiModel;

  Animation animation;
  AnimationController animationController;
  Color iconColors = Color(0xBB000000);

  @override
  void initState() {
    super.initState();
    rootBundle.loadString("assets/json/api_model.json").then((str) {
      Map<String, dynamic> apiJson = json.decode(str);
      setState(() {
        _mApiModel = FlutterApiModel.fromJson(apiJson);
      });
    });
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    animation = new Tween(begin: 0.0, end: 0.25).animate(animationController);
  }

  _changeOpacity(bool expand) {
    setState(() {
      if (expand) {
        animationController.forward();
        iconColors = Color(0xff1296db);
      } else {
        animationController.reverse();
        iconColors = Color(0xBB000000);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_mApiModel == null) {
      return Container();
    }
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: CommonAppBar('api列表'),
      body: ListView(
        children: <Widget>[
          _buildItem('push', _mApiModel.pushList),
          _buildItem('pop', _mApiModel.popList),
          _buildItem('remove', _mApiModel.removeList),
          _buildItem('replace', _mApiModel.replaceList),
          _buildItem('judge', _mApiModel.judgeList),
        ],
      ),
    );
  }

  _buildItem(String title, List<ApiItem> list) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Color(0xFFFEFEFE), width: 1),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ExpansionTile(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: iconColors,
          ),
          textAlign: TextAlign.left,
        ),
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
        children: _getChildrenAction(list),
      ),
    );
  }

  List<Widget> _getChildrenAction(List<ApiItem> list) {
    return List<Widget>.generate(list.length, (int index) {
      ApiItem model = list[index];
      return Container(
        color: Color(0xffffffff),
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => FlutterApiMethodPage(
                          apiItem: list[index],
                        )));
          },
          title: Text(model.method),
          subtitle: Text(
            model.myDesc,
            maxLines: 1,
          ),
          trailing: Icon(
            Icons.chevron_right,
          ),
        ),
      );
    });
  }
}
