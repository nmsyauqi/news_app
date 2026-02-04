import 'package:get/get.dart';

// Import Binding dan View kamu
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/pencarian/bindings/pencarian_binding.dart';
import '../modules/pencarian/views/pencarian_view.dart';
import '../modules/detail_article/bindings/detail_binding.dart';
import '../modules/detail_article/views/detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
    // Perbaikan Bagian Ini (GetPage bukan Getpage)
    GetPage(
      name: _Paths.DETAIL_ARTICLE,
      page: () => const DetailView(),
      binding: DetailArticleBinding(), // Pastikan nama class Binding benar
    ),
  ];
}