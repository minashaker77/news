class ArticleModel {
  ArticleModel(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  String author, title, description, url, urlToImage, publishedAt, content;
}
