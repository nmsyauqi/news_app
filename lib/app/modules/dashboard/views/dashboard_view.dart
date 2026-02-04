import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/app/modules/home/views/home_view.dart';
import 'package:news_app/app/modules/pencarian/views/pencarian_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index:controller.selectedIndex.value,
          children: [
            HomeView(),
            PencarianView(),
          ],
        )
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: controller.changeIndex,
          currentIndex: controller.selectedIndex.value,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.greenAccent,
          elevation: 0,
          items: [
            _bottomNavigationBarItem(
              icon: Icons.home, 
              label: 'HOME', 
              activeIcon: Icons.home,
            ),
            _bottomNavigationBarItem(
              icon: Icons.search, 
              label: 'SEARCH', 
              activeIcon: Icons.search,
            ),
          ],
        )
      ),
    );
  }
}

BottomNavigationBarItem _bottomNavigationBarItem({
  required IconData icon,
  required String label,
  required IconData activeIcon,
}) => BottomNavigationBarItem(
  icon: Icon(icon, color: Colors.black),
  activeIcon: Icon(activeIcon, color: Colors.black),
  label: label,
);