import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../routes/app_pages.dart'; 

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Utama'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.newsList.isEmpty) {
          return const Center(child: Text("Tidak ada berita saat ini"));
        }

        return ListView.builder(
          itemCount: controller.newsList.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            // Ambil satu artikel berdasarkan urutan index
            final article = controller.newsList[index];

            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_ARTICLE, arguments: article);
                },
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // A. Gambar Berita
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: article.urlToImage != null && article.urlToImage!.isNotEmpty
                          ? Image.network(
                              article.urlToImage!,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (ctx, error, stack) => Container(
                                height: 200,
                                color: Colors.grey[300],
                                child: const Center(child: Icon(Icons.broken_image, size: 50)),
                              ),
                            )
                          : Container(
                              height: 200,
                              color: Colors.grey[300],
                              child: const Center(child: Icon(Icons.image, size: 50)),
                            ),
                    ),
                    
                    // B. Teks Judul & Penulis
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.person, size: 14, color: Colors.grey),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  article.author ?? 'Redaksi',
                                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text(
                                // Ambil 10 karakter pertama saja (YYYY-MM-DD)
                                article.publishedAt != null && article.publishedAt!.length > 10
                                    ? article.publishedAt!.substring(0, 10)
                                    : 'Baru saja',
                                style: const TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}