// lib/app/modules/detail_article/bindings/detail_binding.dart
import 'package:get/get.dart';
import '../controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }
}