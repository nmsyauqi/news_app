import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detail_article/bindings/detail_article_binding.dart';
import '../modules/detail_article/bindings/detail_article_binding.dart';
import '../modules/detail_article/views/detail_article_view.dart';
import '../modules/detail_article/views/detail_article_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pencarian/bindings/pencarian_binding.dart';
import '../modules/pencarian/views/pencarian_view.dart';

// Import Binding dan View kamu

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.PENCARIAN,
      page: () => const PencarianView(),
      binding: PencarianBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ARTICLE,
      page: () => const DetailArticleView(),
      binding: DetailArticleBinding(),
      children: [
        GetPage(
          name: _Paths.DETAIL_ARTICLE,
          page: () => const DetailArticleView(),
          binding: DetailArticleBinding(),
        ),
      ],
    ),
  ];
}
