import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/news_model.dart';

class NewsService {
  // Ganti dengan API Key kamu yang valid
  static const String _apiKey = 'f5e415758362451ba9769a68686616c6'; 
  static const String _baseUrl = 'https://newsapi.org/v2';
  static const String _country = 'id';

  // Fetch List Berita (Untuk Home)
  Future<NewsResponse> fetchTopHeadlines() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/top-headlines?country=$_country&apiKey=$_apiKey'),
    );

    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat berita utama');
    }
  }

  // Fetch Detail / Cari Berita (Untuk Detail Controller)
  // Ini fungsi yang dicari oleh Controller kamu
  Future<List<Article>> searchArticles(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/everything?q=$query&apiKey=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final data = NewsResponse.fromJson(json.decode(response.body));
      return data.articles;
    } else {
      throw Exception('Gagal mencari berita');
    }
  }
}