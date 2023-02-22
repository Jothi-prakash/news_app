class NewsFeeds {
  NewsFeeds({
    required this.status,
    required this.sources,
  });

  final String? status;
  final List<NewsSource> sources;

  factory NewsFeeds.fromJson(Map<String, dynamic> json) {
    return NewsFeeds(
      status: json["status"],
      sources: json["sources"] == null
          ? []
          : List<NewsSource>.from(
              json["sources"]!.map((x) => NewsSource.fromJson(x))),
    );
  }
}

class NewsSource {
  NewsSource({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;

  factory NewsSource.fromJson(Map<String, dynamic> json) {
    return NewsSource(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      url: json["url"],
      category: json["category"],
      language: json["language"],
      country: json["country"],
    );
  }
}
