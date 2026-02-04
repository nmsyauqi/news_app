import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailArticleController> {
  const DetailView({super.key}); // Gunakan super.key agar lebih modern

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Berita')),
      body: Obx(() {
        // 1. Loading State
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // 2. Data Kosong
        if (controller.article.value == null) {
          return const Center(child: Text("Data artikel tidak ditemukan"));
        }

        // 3. Tampilkan Data
        final data = controller.article.value!;
        
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Header
              if (data.urlToImage != null)
                Image.network(
                  data.urlToImage!,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, _, __) => Container(
                    height: 250,
                    color: Colors.grey,
                    child: const Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul
                    Text(
                      data.title,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    
                    // Penulis & Tanggal (Handle null dengan ??)
                    Row(
                      children: [
                        const Icon(Icons.person, size: 16, color: Colors.grey),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            data.author ?? 'Unknown Author',
                            style: const TextStyle(color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          data.publishedAt ?? '',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    // Konten Berita
                    Text(
                      data.content ?? 'Tidak ada deskripsi konten.',
                      style: const TextStyle(fontSize: 16, height: 1.5),
                    ),
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