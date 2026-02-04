import 'package:get/get.dart';
import '../controllers/detail_controller.dart';

class DetailArticleBinding extends Bindings {
  @override
  void dependencies() {
    // Pastikan nama class Controller di sini SAMA dengan di file controller
    Get.lazyPut<DetailArticleController>(
      () => DetailArticleController(),
    );
  }
}