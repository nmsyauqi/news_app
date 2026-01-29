import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pencarian_controller.dart';

class PencarianView extends GetView<PencarianController> {
  const PencarianView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PencarianView'),
        centerTitle: true,
      ),
      body: const Center(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'cona tenak'
          ),
        ),
      ),
    );
  }
}
