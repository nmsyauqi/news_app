import 'package:get/get.dart';
import '../../../data/model/news_model.dart';
import '../../../data/service/news_service.dart';

class DetailArticleController extends GetxController {
  // Panggil Service
  final NewsService _newsService = NewsService();

  // Variabel untuk menampung data artikel
  var article = Rxn<Article>();
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Cek data yang dikirim dari halaman sebelumnya
    final args = Get.arguments;

    if (args is Article) {
      // Skenario 1: Jika dikirim data Artikel UTUH (dari Home)
      article.value = args;
      isLoading.value = false;
    } else if (args is String) {
      // Skenario 2: Jika dikirim Judul/ID saja (misal dari Notifikasi)
      fetchArticleDetail(args);
    }
  }

  // Fungsi untuk mengambil data dari API jika argumen cuma String
  void fetchArticleDetail(String query) async {
    try {
      isLoading(true);
      // Memanggil fungsi searchArticles yang sudah kita buat di Service
      var results = await _newsService.searchArticles(query);
      
      if (results.isNotEmpty) {
        article.value = results[0]; // Ambil yang paling cocok (index 0)
      }
    } catch (e) {
      print("Error fetching detail: $e");
    } finally {
      isLoading(false);
    }
  }
}