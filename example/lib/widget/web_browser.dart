import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebBrowser extends StatelessWidget {
  String url;
  String title;

  WebBrowser(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        centerTitle: true,
        title: const Text('简单使用'),
      ),
      body: new WebviewScaffold(
        url: url,
      ),
    );
  }
}
