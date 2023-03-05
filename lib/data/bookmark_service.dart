import 'dart:convert';
import 'dart:io';

import 'package:news_app/model/news_headlines.dart';
import 'package:path_provider/path_provider.dart';

var fileName = 'bookmarkFile.json';

Future<String> getFullFilePath() async {
  var appDirectory = (await getApplicationDocumentsDirectory()).path;
  return '$appDirectory/$fileName';
}

Future<bool> doesBookmarkExists() async {
  var fullFilePath = await getFullFilePath();
  var fileObj = File(fullFilePath);
  return fileObj.existsSync();
}

Future<List<Article>> getBookmarks() async {
  var fullFilePath = await getFullFilePath();
  var fileObj = File(fullFilePath);
  if (fileObj.existsSync()) {
    var jsonString = fileObj.readAsStringSync();
    var jsonObjs = jsonDecode(jsonString) as List;

    return jsonObjs.map((e) {
      return Article.fromJson(e);
    }).toList();
  }
  return <Article>[];
}

Future<bool> addBookmark(Article article) async {
  var fullFilePath = await getFullFilePath();
  var fileObj = File(fullFilePath);
  var bookmarks = await getBookmarks();
  bookmarks.add(article);
  var bookmarkString = jsonEncode(bookmarks);
  fileObj.writeAsStringSync(bookmarkString);
  return true;
}

Future<bool> removeBookmark(Article article) async {
  var bookmarks = await getBookmarks();

  bookmarks.removeWhere((element) => element.title == article.title);
  
  var bookmarkString = jsonEncode(bookmarks);
  var fullFilePath = await getFullFilePath();
  var fileObj = File(fullFilePath);
  fileObj.writeAsStringSync(bookmarkString);
  return true;
}
