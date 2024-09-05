import 'package:news_app_with_flutter_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_with_flutter_clean_architecture/core/usecases/usecase.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUsecase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  const GetArticleUsecase(this._articleRepository);

  @override

  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }
}
