import 'package:flutter/cupertino.dart';

class FlutterApiModel {
  List<ApiItem> pushList;
  List<ApiItem> popList;
  List<ApiItem> removeList;
  List<ApiItem> replaceList;
  List<ApiItem> judgeList;

  FlutterApiModel(
      {this.pushList,
        this.popList,
        this.removeList,
        this.replaceList,
        this.judgeList});

  FlutterApiModel.fromJson(Map<String, dynamic> json) {
    if (json['push_list'] != null) {
      pushList = new List<ApiItem>();
      json['push_list'].forEach((v) {
        pushList.add(new ApiItem.fromJson(v));
      });
    }
    if (json['pop_list'] != null) {
      popList = new List<ApiItem>();
      json['pop_list'].forEach((v) {
        popList.add(new ApiItem.fromJson(v));
      });
    }
    if (json['remove_list'] != null) {
      removeList = new List<ApiItem>();
      json['remove_list'].forEach((v) {
        removeList.add(new ApiItem.fromJson(v));
      });
    }
    if (json['replace_list'] != null) {
      replaceList = new List<ApiItem>();
      json['replace_list'].forEach((v) {
        replaceList.add(new ApiItem.fromJson(v));
      });
    }
    if (json['judge_list'] != null) {
      judgeList = new List<ApiItem>();
      json['judge_list'].forEach((v) {
        judgeList.add(new ApiItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pushList != null) {
      data['push_list'] = this.pushList.map((v) => v.toJson()).toList();
    }
    if (this.popList != null) {
      data['pop_list'] = this.popList.map((v) => v.toJson()).toList();
    }
    if (this.removeList != null) {
      data['remove_list'] = this.removeList.map((v) => v.toJson()).toList();
    }
    if (this.replaceList != null) {
      data['replace_list'] = this.replaceList.map((v) => v.toJson()).toList();
    }
    if (this.judgeList != null) {
      data['judge_list'] = this.judgeList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApiItem {
  String method;
  List<Params> params;
  String apiLink;
  String myDesc;
  String example;
  String exampleDesc;

  ApiItem(
      {this.method,
        this.params,
        this.apiLink,
        this.myDesc,
        this.example,
        this.exampleDesc});

  ApiItem.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    if (json['params'] != null) {
      params = new List<Params>();
      json['params'].forEach((v) {
        params.add(new Params.fromJson(v));
      });
    }
    apiLink = json['api_link'];
    myDesc = json['my_desc'];
    example = json['example'];
    exampleDesc = json['example_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    if (this.params != null) {
      data['params'] = this.params.map((v) => v.toJson()).toList();
    }
    data['api_link'] = this.apiLink;
    data['my_desc'] = this.myDesc;
    data['example'] = this.example;
    data['example_desc'] = this.exampleDesc;
    return data;
  }
}

class Params {
  String name;
  String desc;

  Params({this.name, this.desc});

  Params.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['desc'] = this.desc;
    return data;
  }
}

