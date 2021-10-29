import 'package:ayus/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        Get.offAndToNamed(Routes.DASHBOARD);
      },
    );
    super.onInit();
  }
}
