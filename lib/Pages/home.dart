import 'package:flutter/material.dart';
import 'package:kuis1/dummy_menu.dart';
import './detail.dart';

class Home extends StatelessWidget {
  final String username;
  final String? nickname;

  Home({super.key, required this.username, required this.nickname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Makanan'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat datang ${nickname ?? username}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8), // Jarak antara dua teks
                const Text(
                  'Klik menu untuk informasi lebih lanjut.',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foodMenuList.length,
              itemBuilder: (context, index) {
                final menu = foodMenuList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          name: menu.name,
                          kategori: menu.category,
                          deskripsi: menu.description,
                          ingredients: menu.ingredients,
                          lama: menu.cookingTime,
                          harga: menu.price,
                          image: menu.imageAsset,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Image.network(
                          menu.imageAsset,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          menu.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
