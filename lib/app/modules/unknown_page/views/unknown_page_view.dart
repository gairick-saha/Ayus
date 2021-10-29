import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/unknown_page_controller.dart';

class UnknownPageView extends GetView<UnknownPageController> {
  const UnknownPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UnknownPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UnknownPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
