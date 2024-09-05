import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_with_flutter_clean_architecture/core/constants/constants.dart';
import 'package:news_app_with_flutter_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoyImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  const ArticleRepositoyImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpReponse = await _newsApiService.getNewsArticle(
          apiKey: newsAPIKey, country: countryQuery, category: categoryQuery);
      log('Response: ${httpReponse.data.toJson()}');

      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data.articles);
      } else {
        log('Response: ${httpReponse.data.toJson()}');
        return DataError(DioException(
            error: httpReponse.response.statusMessage,
            response: httpReponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
