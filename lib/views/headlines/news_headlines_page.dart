import 'package:flutter/material.dart';
import 'package:news_app/data/news_datas.dart';

import 'package:news_app/model/news_headlines.dart';
import 'package:news_app/views/bookmark/news_bookmark.dart';
import 'package:news_app/views/filter/news_filter.dart';
import 'package:news_app/views/widget/news_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var  selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News')
      ),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.newspaper_rounded),label:'Headlines'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_border_rounded),label: 'Bookmark'),
        BottomNavigationBarItem(icon: Icon(Icons.filter_alt_rounded),label: 'Filter')
      ],onTap: (value) {
        setState(() {
          selectedIndex=value;
        });
        
      }, ),
      body: getBottomBodyContent(),
    );
  }

Widget getBottomBodyContent()
{
  switch (selectedIndex){
  case 0:
  return  getBody();
  case 1:
  return const NewsBookmark();
  case 2:
  return const NewsFilter();
  }
  return const HomeScreen();
} 

  Widget getBody() {
    return getArticleFuture();
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
      );
      articleWidgets.add(articleWidget);
    }

    return ListView(children: articleWidgets);
  }
}
