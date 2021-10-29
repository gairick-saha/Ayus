import 'package:ayus/app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(
              0.4999999483964715,
              -1.6949985039883048e-11,
            ),
            end: Alignment(0.49866661508304827, 0.8657635449150927),
            colors: AppTheme.blueGradient,
          ),
        ),
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: SizedBox.square(
              dimension: Get.width * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/Ayus-Logo.png',
                  scale: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
