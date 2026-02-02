class NewsResponse {
    final String status;
    final int totalResults;
    final List<Article> articles;

    NewsResponse({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory NewsResponse.fromJson(Map<String, dynamic> json) => NewResponse(
        status: json["status"] ?? "",
        totalResults: json["totalResults"] ?? 0,
        articles: List<Article>.from((json["articles"] ?? []).map((x) => Article.fromJson(x))),
    );

}


class Article {
    final String title;
    final String? author;
    final String description;
    final String? imageToUrl;
    final String url;

    Article({
        required this.title,
        this.author,
        required this.description,
        this.imageToUrl,
        required this.url
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"] ?? "",
        author: json["author"],
        description: json["description"] ?? "No Description",
        imageToUrl: json["imageToUrl"],
        url: json["url"] ?? "",
    );
}