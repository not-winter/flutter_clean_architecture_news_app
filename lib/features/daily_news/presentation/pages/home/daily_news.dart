import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/presentation/bloc/remote_article_bloc.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/presentation/navigators/article_navigator.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/presentation/widgets/article_item.dart';
import 'package:news_app_with_flutter_clean_architecture/injector.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: const Page(),
    );
  }
}

class Page extends StatelessWidget {
  const Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Daily News'),
    );
  }

  _buildBody(BuildContext context) {
    final navigator = ArticleNavigator(context);

    return BlocConsumer<RemoteArticleBloc, RemoteArticleState>(
      listener: (context, state) {
        if (state is RemoteArticleException) {
          navigator.showSnackbar(
              state.exception?.toString() ?? 'Something went wrong');
        }
      },
      builder: (context, state) {
        if (state is RemoteArticleLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RemoteArticleDone) {
          if (state.articles!.isEmpty) {
            return const Center(child: Text('No articles found'));
          }
          return ListView.builder(
            itemCount: state.articles?.length,
            itemBuilder: (context, index) {
              final article = state.articles![index];
              return ArticleItem(
                article: article,
                onArticlePressed: (article) =>
                    navigator.onArticlePressed(article),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
