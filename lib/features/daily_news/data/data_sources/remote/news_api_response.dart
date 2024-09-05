import 'package:news_app_with_flutter_clean_architecture/features/daily_news/data/models/article.dart';

class NewsApiResponse {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  NewsApiResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsApiResponse.fromJson(Map<String, dynamic> json) {
    return NewsApiResponse(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: List<ArticleModel>.from(
        json['articles'].map((x) => ArticleModel.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    data['articles'] = articles.map((x) => x.toJson()).toList();
    return data;
  }
}
