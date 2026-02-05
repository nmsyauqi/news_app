import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_article_controller.dart';

class DetailArticleView extends GetView<DetailArticleController> {
  const DetailArticleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailArticleView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailArticleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
