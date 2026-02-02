import 'package:get/get_connect/connect.dart';
import 'package:get/get.dart';
import 'package:news_app/app/data/constants.dart';

class NewsService extends GetConnect{
  Future<Response> getNewsIDN() => get(
    "${Endpoints.baseUrl}/everything",
    query: {
      "q": "indonesia",
      "from": "2026-01-29",
      "sortBy": "publishedAt",
      "apiKey": Endpoints.apiKey,
    }
  );
}