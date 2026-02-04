// lib/app/modules/dashboard/controllers/dashboard_controller.dart
import 'package:get/get.dart';

class DashboardController extends GetxController {
  // Variabel untuk menyimpan index tab yang aktif (0 = Home, 1 = Pencarian)
  var selectedIndex = 0.obs;

  // Fungsi untuk ganti tab
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}