import 'package:flutter/material.dart';
import 'package:news_app_with_flutter_clean_architecture/config/routes/routes.dart';
import 'package:news_app_with_flutter_clean_architecture/config/theme/app_themes.dart';
import 'package:news_app_with_flutter_clean_architecture/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app_with_flutter_clean_architecture/injector.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clean Architecture',
      theme: theme(),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: const DailyNews(),
    );
  }
}
