import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_with_flutter_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/domain/usecases/get_article_usecase.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUsecase _getArticleUsecase;

  RemoteArticleBloc(this._getArticleUsecase)
      : super(const RemoteArticleInitial()) {
    on<GetArticles>(_onGetArticles);
  }

  void _onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    emit(const RemoteArticleLoading());
    final dataState = await _getArticleUsecase.call();
    if (dataState is DataSuccess) {
      emit(RemoteArticleDone(articles: dataState.data ?? []));
    }

    if (dataState is DataError) {
      emit(RemoteArticleException(exception: dataState.error!));
    }
  }
}
