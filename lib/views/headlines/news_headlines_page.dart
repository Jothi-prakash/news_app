import 'package:flutter/material.dart';
import 'package:news_app/views/widget/news_widgets.dart';

import '../../data/news_datas.dart';
import '../../model/news_headlines.dart';

class NewsHeadlinesPage extends StatefulWidget {
  const NewsHeadlinesPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewsHeadlinesPageState createState() => _NewsHeadlinesPageState();
}

class _NewsHeadlinesPageState extends State<NewsHeadlinesPage> {
  @override
  Widget build(BuildContext context) {
    return getArticleFuture();
  }
}

Widget getArticleFuture() {
  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return getListView(snapshot.data);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
    future: getHeadlineArticles(),
  );
}

Widget getListView(List<Article>? data) {
  if (data == null || data.isEmpty) {
    return const Center(
      child: Text('Error in getting data'),
    );
  }

  var articleWidgets = <Widget>[];
  for (var articles in data) {
    var articleWidget = NewsWidgets(
      article: articles,
      showBookmarks: true,
    );
    articleWidgets.add(articleWidget);
  }

  return ListView(children: articleWidgets);
}
