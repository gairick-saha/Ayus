import 'package:ayus/app/routes/app_pages.dart';
import 'package:ayus/app/themes/app_theme.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ayus',
      theme: AppTheme.themeData,
      navigatorKey: Get.key,
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      unknownRoute: AppPages.unknownRoute,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      popGesture: Get.isPopGestureEnable,
      locale: Get.deviceLocale,
      transitionDuration: Get.defaultTransitionDuration,
      defaultTransition: Get.defaultTransition,
    );
  }
}
