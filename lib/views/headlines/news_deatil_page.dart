import 'package:flutter/material.dart';
import 'package:native_webview/native_webview.dart';

class NewsDetailPage extends StatelessWidget {
  final String? newsUrl;
  final String? title;
  const NewsDetailPage({Key? key, required this.newsUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: WebView(initialUrl: newsUrl),
    );
  }
}
