import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:tugas4_api_test/model/book_list_get.dart';

class BookList extends StatefulWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  Map<String, dynamic>? responListBook;
  getDataSatuBuku() async {
    var url = Uri.parse('https://api.itbook.store/1.0/books/9781484206485');
    var response = await http.get(
      url,
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      responListBook = jsonDecode(response.body);
      setState(() {});
    }
  }

  List<Widget> listBuku = [];
  GetBookList? dataBuku;
  getDataListBuku() async {
    var url = Uri.parse('https://api.itbook.store/1.0/new');
    var response = await http.get(
      url,
    );
    print("Response Status = ${response.statusCode}");
    print("Response Body = ${response.body}");
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      dataBuku = GetBookList.fromJson(json);
      dataBuku!.books!.forEach((item) {
        final widget = Row(
          children: [
            Image.network(
              item.image!,
              height: 200,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title!),
                Text(
                  item.subtitle!,
                  style: TextStyle(color: Colors.blueAccent),
                )
              ],
            ))
          ],
        );
        listBuku.add(widget);
      });
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataSatuBuku();
    getDataListBuku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Daftar Buku",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.cyan,
          centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(responListBook == null ? "data" : responListBook!["desc"]),
            ...listBuku,
          ],
        ),
      ),
    );
  }
}
