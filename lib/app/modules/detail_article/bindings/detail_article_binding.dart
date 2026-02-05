import 'package:get/get.dart';
import 'package:news_app/app/modules/detail_article/controllers/detail_article_controller.dart';
import 'package:news_app/app/modules/home/bindings/home_binding.dart';
import 'package:news_app/app/modules/pencarian/bindings/pencarian_binding.dart';

import '../controllers/detail_article_controller.dart';

class DetailArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailArticleController>(
      () => DetailArticleController(),
    );
    HomeBinding().dependencies();
    PencarianBinding().dependencies();
  }
}
