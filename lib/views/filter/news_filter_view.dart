import 'package:flutter/material.dart';
import 'package:news_app/model/news_filter.dart';
import 'package:news_app/views/filter/filter_result.dart';
import 'package:news_app/views/filter/filter_widget.dart';

class NewsFilterView extends StatefulWidget {
  const NewsFilterView({Key? key}) : super(key: key);

  @override
  State<NewsFilterView> createState() => _NewsFilterViewState();
}

class _NewsFilterViewState extends State<NewsFilterView> {
  bool isFilterShown = true;

  NewsFilter? filterObj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isFilterShown
            ? FilterWidget(onFiltered: (NewsFilter filter) {
                setState(() {
                  filterObj = filter;
                  isFilterShown = false;
                });
              })
            : FilterResult(filter: filterObj!));
  }
}
