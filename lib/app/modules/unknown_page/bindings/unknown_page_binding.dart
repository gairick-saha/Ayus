import 'package:get/get.dart';

import '../controllers/unknown_page_controller.dart';

class UnknownPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnknownPageController>(
      () => UnknownPageController(),
    );
  }
}
