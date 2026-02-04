import 'package:get/get.dart';
import '../../../data/model/news_model.dart';
import '../../../data/services/news_service.dart'; // Pastikan path services pakai 's'

class HomeController extends GetxController {
  // Panggil Service
  final NewsService _newsService = NewsService();
  
  // Tampungan data
  var newsList = <Article>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  void fetchNews() async {
    try {
      isLoading(true);
      // PERBAIKAN: Gunakan 'fetchTopHeadlines' (bukan getNewsIDN)
      var response = await _newsService.fetchTopHeadlines();
      newsList.assignAll(response.articles);
    } catch (e) {
      print("Error fetching news: $e");
    } finally {
      isLoading(false);
    }
  }
}