import 'package:flutter/material.dart';
import 'package:news_app_with_flutter_clean_architecture/core/utils/app_navigator.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/domain/entities/article.dart';

class ArticleNavigator extends AppNavigator {
  ArticleNavigator(super.context);

  void onArticlePressed(ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
