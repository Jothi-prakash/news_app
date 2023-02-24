import 'package:dio/dio.dart';

import '../Model/news_headlines.dart';

var dio = Dio();
Future<List<Article>> getNewsHeadlines() async {
  var newsItems = <Article>[];

  //URI
  var response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=2ed2c11a2fa04b55b14fff672b7e175f');

  if (response.statusCode == 200) {
    var newsJsons = response.data;
    var news = <Article>[];
    for (var newsJson in newsJsons) {
      var newsHeadlinesObj = Article.fromJson(newsJson);
      news.add(newsHeadlinesObj);
    }
    return news;
  }
  return newsItems;
}