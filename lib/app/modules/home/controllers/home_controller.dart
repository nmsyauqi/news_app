import 'package:get/get.dart';
import 'package:news_app/app/data/model/news_model.dart';
import 'package:news_app/app/data/services/news_service.dart';

class HomeController extends GetxController {
  final NewsService newsService = Get.find();

  var articles = <Article>[].obs;
  var isLoading = true.obs;

  final count = 0.obs;

  void getNewsIDN() async {
    try {
      isLoading(true);
      final response = await newsService.getNewsIDN();
      if(response.status.isOk){
        final newsData = NewsResponse.fromJson(response.body);
        articles.assignAll(newsData.articles);
      }
    } catch (e) {
        print("error $e");
    } finally {
        isLoading(false);
    }
  }



  void increment() => count.value++;
}
