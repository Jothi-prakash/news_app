import 'dart:convert';
import 'dart:io';

import 'package:news_app/model/news_headlines.dart';
import 'package:path_provider/path_provider.dart';

import 'news_headline_service.dart';

String getNewsFileName() {
  var newsdate = DateTime.now();

  return '${newsdate.day.toString()}-${newsdate.month.toString()}-${newsdate.year.toString()}_Headlines.json';
}

Future<String> getFullFilePath() async {
  var appDirectory = (await getApplicationDocumentsDirectory()).path;
  return '$appDirectory/${getNewsFileName()}';
}

Future<List<Article>> getHeadlineArticles() async {
  // get the full file path of today's headline json
  var fullFilePath = await getFullFilePath();
  //construct a file object based on the above file path
  var fileObj = File(fullFilePath);
  //chech if file exists
  if (fileObj.existsSync()) {
    // read file as string
    var jsonString = fileObj.readAsStringSync();
    //convert string to json
    var jsonObj = jsonDecode(jsonString);
    // convert json to news headlines
    var newsHeadlines = NewsHeadlines.fromJson(jsonObj);
    //return list of articles
    return newsHeadlines.articles;
  }

  // call API to get a response
  var response = await dio.get(
      'https://newsapi.org/v2/everything?q=india&apiKey=2ed2c11a2fa04b55b14fff672b7e175f');

  if (response.statusCode == 200) {
    //get the json object
    var jsonObj = response.data;
    //covert json to string
    var jsonString = jsonEncode(jsonObj);
    //write the contents to file
    fileObj.writeAsStringSync(jsonString);
// convert json to news headlines
    var newsHeadlines = NewsHeadlines.fromJson(jsonObj);
    //return list of articles
    return newsHeadlines.articles;
  }

  //return list iof articles
  return <Article>[];
}
