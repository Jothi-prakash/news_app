import 'package:flutter/material.dart';
import 'package:news_app/data/bookmark_service.dart';
import '../../model/news_headlines.dart';
import '../widget/news_widgets.dart';

class NewsBookmark extends StatefulWidget {
  const NewsBookmark({Key? key}) : super(key: key);

  @override
  State<NewsBookmark> createState() => _NewsBookmarkState();
}

class _NewsBookmarkState extends State<NewsBookmark> {
  @override
  Widget build(BuildContext context) {
    return getBookmarkArticleFuture();
  }
}

Widget getBookmarkArticleFuture() {
  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return getListView(snapshot.data);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
    future: getBookmarks(),
  );
}

Widget getListView(List<Article>? data) {
  if (data == null || data.isEmpty) {
    return const Center(
      child: Text('There are no bookmarked articles.'),
    );
  }

  var articleWidgets = <Widget>[];
  for (var articles in data) {
    var articleWidget = NewsWidgets(
      article: articles,
      showBookmarks: false,
    );
    articleWidgets.add(articleWidget);
  }

  return ListView(children: articleWidgets);
}
