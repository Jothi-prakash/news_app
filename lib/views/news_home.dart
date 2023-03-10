import 'package:flutter/material.dart';
import 'package:news_app/views/bookmark/news_bookmark.dart';
import 'package:news_app/views/filter/news_filter_view.dart';
import 'headlines/news_headlines_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(getAppBarTitle())),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_rounded), label: 'Headlines'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_rounded), label: 'Bookmark'),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_alt_rounded), label: 'Filter')
        ],
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      body: getBottomBodyContent(),
    );
  }

  String getAppBarTitle() {
    switch (selectedIndex) {
      case 0:
        return 'News';
      case 1:
        return 'Bookmarks';
      case 2:
        return 'Filter';
    }
    return 'News';
  }

  Widget getBottomBodyContent() {
    switch (selectedIndex) {
      case 0:
        return const NewsHeadlinesPage();
      case 1:
        return const NewsBookmark();
      case 2:
        return  const NewsFilterView();
    }
    return const HomeScreen();
  }
}
