import 'package:ayus/app/routes/app_pages.dart';
import 'package:ayus/app/routes/route_model.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final List<RouteModel> routeItems = AppPages.nestedRoutes;

  final RxInt currentBottomNavItemIndex = 0.obs;

  String get initialRoute => routeItems[currentBottomNavItemIndex.value].route;

  final nestedKey = Get.nestedKey(1);

  GetPageRoute onGenerateRoute(settings) {
    final currentUrl = settings.name;
    final model = RouteModel.routes[currentUrl];
    return GetPageRoute(
      routeName: currentUrl,
      settings: settings,
      page: model?.page ?? AppPages.unknownRoute.page,
      binding: model?.binding,
      middlewares: model?.middlewares,
      transition: Transition.rightToLeftWithFade,
      curve: Curves.fastOutSlowIn,
      transitionDuration: 400.milliseconds,
      opaque: false,
    );
  }

  void processRouting(Routing? route) {
    final _dict = RouteModel.routes;
    var url = route!.route?.settings.name;
    if (_dict.containsKey(url)) {
      Get.routing.current = url!;
      Get.log("Cerrent menu : $url");
      Get.log('Cerrent menu index : ${routeItems.indexOf(_dict[url]!)}');
    }
  }

  void changeTab(int index) {
    currentBottomNavItemIndex(index);
    Get.offAndToNamed(
      routeItems[currentBottomNavItemIndex.value].route,
      id: 1,
    );
  }

  Future<bool> handleBackButton() async {
    bool sholdBack = false;
    if (currentBottomNavItemIndex.value == 0) {
      sholdBack = true;
    }
    if (currentBottomNavItemIndex.value == 1) {
      changeTab(0);
    }
    if (currentBottomNavItemIndex.value == 2) {
      changeTab(1);
    }
    if (currentBottomNavItemIndex.value == 3) {
      changeTab(2);
    }
    return sholdBack;
  }
}
