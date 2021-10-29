import 'package:ayus/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/consult_controller.dart';

class ConsultView extends GetView<ConsultController> {
  const ConsultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "My Patients",
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: Get.width * 0.03,
            ),
            child: IconButton(
              onPressed: () {
                debugPrint('Open menu');
              },
              icon: Image.asset('assets/images/menu.png'),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'ConsultView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
