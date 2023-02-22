import 'package:app_test_mnc/news/models/news_model.dart';

class NewsResponse {
  final List<NewsModel>? newsData;

  NewsResponse(this.newsData);

  factory NewsResponse.fromJson(List<dynamic> json) => NewsResponse(
        List<NewsModel>.from((json).map((x) => NewsModel.fromJson(x))),
      );
}
