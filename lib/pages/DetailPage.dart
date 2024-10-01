import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'dart:async'; 

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _paragraph = ''; // Variabel untuk menyimpan isi paragraf

  @override
  void initState() {
    super.initState();
    _loadParagraph(); // Memanggil fungsi untuk memuat isi file
  }

  Future<void> _loadParagraph() async {
    try {
      // Mengambil isi file Paragraf.txt
      String paragraph = await rootBundle.loadString('Paragraf.txt');
      setState(() {
        _paragraph = paragraph; 
      });
    } catch (e) {
      setState(() {
        _paragraph = 'Error loading paragraph'; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Agar teks rata kiri
          children: [
            Image.asset('images/header.png'), 
            SizedBox(height: 20),
            Text(
              'Apa itu Bank Sampah',
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
              ),
            ),
            SizedBox(height: 10), 
            Text(
              _paragraph, // Menampilkan isi dari file Paragraf.txt
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
