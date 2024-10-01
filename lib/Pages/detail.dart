import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String image;
  final String kategori;
  final String deskripsi;
  final String ingredients;
  final String lama;
  final String harga;

  DetailPage({required this.name, required this.image, required this.kategori, required this.deskripsi, required this.ingredients, required this.lama, required this.harga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
    
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(image, height: 200, fit: BoxFit.cover),
            SizedBox(height: 20),
            Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              image,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              kategori,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              deskripsi,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              ingredients,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              lama,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              harga,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
           
            Spacer(),
            
            
          ],
        ),
      ),
    );
  }
}
