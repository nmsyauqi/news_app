import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'apalah cona tenask',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'riwayat',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ListTile(
              leading: const Icon(Icons.history, color: Colors.grey),
              title: const Text('tuturioul bos'),
              trailing: const Icon(Icons.close, size: 16),
              onTap: () {

              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.trending_up, color: Colors.blue),
              title: const Text('gorengan'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 12),
              onTap: () {

              },
            )
          ],
          ),
        ),
      ),
    );
  }
}
