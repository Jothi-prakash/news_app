import 'package:intl/intl.dart';

class NewsHeadlines {
  NewsHeadlines({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String? status;
  final int? totalResults;
  final List<Article> articles;

  factory NewsHeadlines.fromJson(Map<String, dynamic> json) {
    return NewsHeadlines(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: json["articles"] == null
          ? []
          : List<Article>.from(
              json["articles"]!.map((x) => Article.fromJson(x))),
    );
  }
}

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: json["source"] == null ? null : Source.fromJson(json["source"]),
      author: json["author"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: DateTime.tryParse(json["publishedAt"]),
      content: json["content"],
    );
  }

  Map<String, dynamic> toJson() {
    var m = {
      'source': source!.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt.toString(),
      'content': content
    };
    return m;
  }

  String getDateString() {
    if (publishedAt == null) {
      return '';
    }
    return DateFormat('dd MMM').format(publishedAt!);
  }
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    var m = {
      'id': id,
      'name': name,
    };
    return m;
  }
}
