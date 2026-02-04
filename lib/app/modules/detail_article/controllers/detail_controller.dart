import 'package:get/get.dart';
import '../../../data/model/news_model.dart';
// PERBAIKAN: Tambah 's' pada folder services
import '../../../data/services/news_service.dart'; 

class DetailArticleController extends GetxController {
  final NewsService _newsService = NewsService();

  var article = Rxn<Article>();
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;

    if (args is Article) {
      article.value = args;
      isLoading.value = false;
    } else if (args is String) {
      fetchArticleDetail(args);
    }
  }

  void fetchArticleDetail(String query) async {
    try {
      isLoading(true);
      var results = await _newsService.searchArticles(query);
      if (results.isNotEmpty) {
        article.value = results[0];
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}