import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/data/repository/article_repositoy_impl.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/domain/usecases/get_article_usecase.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/presentation/bloc/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // factory -> new instance
  // singleton -> same instance

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Services
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  // Repositories
  sl.registerSingleton<ArticleRepository>(ArticleRepositoyImpl(sl()));

  // Usecases
  sl.registerSingleton<GetArticleUsecase>(GetArticleUsecase(sl()));

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
