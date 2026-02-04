class NewsResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'] ?? '',
      totalResults: json['totalResults'] ?? 0,
      articles: List<Article>.from(
        (json['articles'] as List).map((x) => Article.fromJson(x)),
      ),
    );
  }
}

class Article {
  final Source source;
  final String? author;
  final String title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt; // Menambahkan ini
  final String? content;     // Menambahkan ini

  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'] ?? 'No Title',
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'], // Mapping JSON ke variabel
      content: json['content'],         // Mapping JSON ke variabel
    );
  }
}

class Source {
  final String? id;
  final String name;

  Source({this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'] ?? 'Unknown',
    );
  }
}