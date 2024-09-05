import 'package:dio/dio.dart';
import 'package:news_app_with_flutter_clean_architecture/core/constants/constants.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/data/data_sources/remote/news_api_response.dart';
import 'package:retrofit/retrofit.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<NewsApiResponse>> getNewsArticle({
    @Query('apiKey') String? apiKey,
    @Query('country') String? country,
    @Query('category') String? category,
  });
}
