import 'package:dio/dio.dart';

import '../model/news_headlines.dart';

var dio = Dio();
Future<List<Article>> getNewsHeadlines() async {
  var newsItems = <Article>[];

  //URI
  var response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=2ed2c11a2fa04b55b14fff672b7e175f');

  if (response.statusCode == 200) {
    var newsJsons = response.data;
    var newsHeadlinesObj=NewsHeadlines.fromJson(newsJsons);
    return newsHeadlinesObj.articles;
  }
  return newsItems;
}