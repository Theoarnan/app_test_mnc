import 'dart:convert';
import 'dart:developer';

import 'package:app_test_mnc/news/models/news_response.dart';
import 'package:dio/dio.dart';

class NewsRepository {
  final Dio dio = Dio();
  Future<NewsResponse?> getNews() async {
    try {
      Response<String> response = await dio.get(
          "https://60a4954bfbd48100179dc49d.mockapi.io/api/innocent/newsapp/articles");
      NewsResponse movieResponse =
          NewsResponse.fromJson(json.decode(response.data!));
      return movieResponse;
    } catch (e) {
      log('[LOG]: $e');
      return null;
    }
  }
}
