import 'package:get/get.dart';
import 'package:news_app/app/data/services/news_service.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<NewsService>(()=> NewsService());
  }
}
