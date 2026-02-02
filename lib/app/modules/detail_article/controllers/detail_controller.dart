// lib/app/modules/detail_article/controllers/detail_controller.dart
import 'package:get/get.dart';
import 'package:news_app/app/data/services/news_service.dart';
import '../../../data/model/news_model.dart';
import '../../../data/services/news_service.dart';

class DetailController extends GetxController {
  // 1. Siapkan Service
  final NewsService _newsService = NewsService();

  // 2. Variabel penampung data (Reactive)
  var article = Rxn<Article>(); // Bisa null
  var isLoading = true.obs;     // Status loading

  @override
  void onInit() {
    super.onInit();
    // Ambil ID yang dikirim dari halaman sebelumnya
    final String articleId = Get.arguments; 
    loadArticleDetail(articleId);
  }

  // Fungsi detailArticles() sesuai permintaan tugas
  void loadArticleDetail(String id) async {
    try {
      isLoading(true); // Mulai loading
      var result = await _newsService.fetchDetailArticle(id);
      article.value = result; // Simpan data
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false); // Selesai loading
    }
  }
}