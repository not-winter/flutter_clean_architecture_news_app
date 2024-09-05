part of 'remote_article_bloc.dart';

sealed class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? exception;
  const RemoteArticleState({this.articles, this.exception});

  @override
  List<Object> get props => [articles!, exception!];
}

final class RemoteArticleInitial extends RemoteArticleState {
  const RemoteArticleInitial();
}

final class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

final class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone({required List<ArticleEntity> articles})
      : super(articles: articles);
}

final class RemoteArticleException extends RemoteArticleState {
  const RemoteArticleException({required DioException exception})
      : super(exception: exception);
}
