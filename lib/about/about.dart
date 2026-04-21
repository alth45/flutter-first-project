import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🖼️ Gambar bulat
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://picsum.photos/seed/about/200',
                ),
              ),
              SizedBox(height: 20),

              // 📝 Teks
              Text(
                'Aplikasi ini dibuat untuk belajar Flutter. \n\n'
                'Dibuat oleh: Your Name\n'
                'Versi: 1.0.0\n'
                'Tanggal Rilis: 2024-06-01\n\n'
                'Terima kasih telah menggunakan aplikasi ini!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}