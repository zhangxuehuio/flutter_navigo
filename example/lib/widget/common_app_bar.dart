import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_navigo_example/widget/config.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;

  CommonAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          if (Config.popModel == 2) {
            Navigator.maybePop(context).then((result) {
              if (result) {
                Navigator.pop(context);
              }
              Fluttertoast.showToast(
                  msg: "maybePop 返回 " +
                      result.toString() +
                      (result ? "正常关闭" : "关闭失败"));
            });
          } else if (Config.popModel == 1) {
            bool isCanPop = Navigator.canPop(context);
            if (isCanPop) {
              Navigator.pop(context);
            }
            Fluttertoast.showToast(
                msg: "canPop 返回 " +
                    isCanPop.toString() +
                    (isCanPop ? "正常关闭" : "关闭失败"));
          } else {
            Navigator.pop(context);
          }
        },
        child: Icon(Icons.arrow_back_ios),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.normal, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 48);
}
