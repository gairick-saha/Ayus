import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.handleBackButton,
      child: Obx(
        () => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentBottomNavItemIndex.value,
            onTap: controller.changeTab,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).disabledColor,
            selectedLabelStyle: GoogleFonts.openSans().copyWith(
              color: Theme.of(context).primaryColor,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: GoogleFonts.openSans().copyWith(
              color: Theme.of(context).disabledColor,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
            ),
            items: List.generate(
              controller.routeItems.length,
              (index) => BottomNavigationBarItem(
                label: controller.routeItems[index].title,
                // activeIcon: Icon(controller.routeItems[index].activeIcon),
                icon: Image.asset(
                  controller.routeItems[index].icon,
                  scale: 1,
                  width: 20,
                  height: 20,
                  color: controller.currentBottomNavItemIndex.value == index
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).disabledColor,
                ),
              ),
            ),
          ),
          body: Navigator(
            key: controller.nestedKey,
            initialRoute: controller.initialRoute,
            observers: [GetObserver(controller.processRouting, Get.routing)],
            onGenerateRoute: controller.onGenerateRoute,
          ),
        ),
      ),
    );
  }
}
