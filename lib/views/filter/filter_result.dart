import 'package:flutter/material.dart';
import 'package:news_app/data/filter_service.dart';
import 'package:news_app/model/news_filter.dart';


import '../../model/news_headlines.dart';
import '../widget/news_widgets.dart';

class FilterResult extends StatefulWidget {
  final NewsFilter? filter;
  const FilterResult({ Key? key,required this.filter }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FilterResultState createState() => _FilterResultState();
}

class _FilterResultState extends State<FilterResult> {
  @override
  Widget build(BuildContext context) {
    return getFilterNewsArticleFuture();
      
   
  }
  Widget getFilterNewsArticleFuture() {
  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return getResults(snapshot.data!);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
    future: searchFilterNews(widget.filter!),
  );
}
Widget getResults(List<Article> data)
{
if(data.isEmpty)
{
  return const Center(child: Text('There is no relevant filtered data'));
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
}
