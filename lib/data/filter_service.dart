import 'package:dio/dio.dart';
import 'package:news_app/model/news_headlines.dart';

import '../model/news_filter.dart';


Future<List<Article>> searchFilterNews(NewsFilter filter) async
{
  var dio = Dio();
var response =
      await dio.get('https://newsapi.org/v2/everything?q=${filter.searchTerm}&apiKey=2ed2c11a2fa04b55b14fff672b7e175f');

  if (response.statusCode == 200) {
    var searchItemJsons = response.data;
    var searchItemObj = NewsHeadlines.fromJson(searchItemJsons);
    return searchItemObj.articles;
  }
  return<Article>[];
}