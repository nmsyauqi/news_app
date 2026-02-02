// lib/app/modules/detail_article/controllers/detail_controller.dart
import 'package:get/get.dart';
import '../../../data/models/article_model.dart';
import '../../../data/services/http_service.dart';

class DetailController extends GetxController {
  // 1. Siapkan Service
  final HttpService _httpService = HttpService();

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
      var result = await _httpService.fetchDetailArticle(id);
      article.value = result; // Simpan data
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false); // Selesai loading
    }
  }
}