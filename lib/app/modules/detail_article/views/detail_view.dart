// lib/app/modules/detail_article/views/detail_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Berita")),
      body: Obx(() {
        // 1. Cek apakah sedang loading?
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // 2. Cek apakah data kosong?
        if (controller.article.value == null) {
          return const Center(child: Text("Data tidak ditemukan"));
        }

        // 3. Tampilkan Data
        final data = controller.article.value!;
        return SingleChildScrollView(
          child: Column(
            children: [
              Image.network(data.urlToImage),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(data.publishedAt, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 20),
                    Text(data.content),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}