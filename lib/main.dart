import 'package:flutter/material.dart';
import 'package:tugas4_api_test/model/book_list_get.dart';
import 'package:tugas4_api_test/pages/book_detail.dart';
import 'package:tugas4_api_test/pages/book_list.dart';
import 'package:tugas4_api_test/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Daftar Buku",
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/booklist': (context) => BookList(),
        '/bookdetail': (context) => BookDetail()
      },
    );
  }
}
