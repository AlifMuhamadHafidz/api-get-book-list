import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas4_api_test/model/book_list_get.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  State<BookDetail> createState() => _DetailBukuState();
}

class _DetailBukuState extends State<BookDetail> {
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

  Map<String, dynamic>? responListBook2;
  getDataSatuBuku2() async {
    var url = Uri.parse('https://api.itbook.store/1.0/books/9781617294136');
    var response = await http.get(
      url,
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      responListBook2 = jsonDecode(response.body);
      setState(() {});
    }
  }

  Map<String, dynamic>? responListBook3;
  getDataSatuBuku3() async {
    var url = Uri.parse('https://api.itbook.store/1.0/books/9781491954249');
    var response = await http.get(
      url,
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      responListBook3 = jsonDecode(response.body);
      setState(() {});
    }
  }

  Map<String, dynamic>? responListBook4;
  getDataSatuBuku4() async {
    var url = Uri.parse('https://api.itbook.store/1.0/books/9781491999226');
    var response = await http.get(
      url,
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      responListBook4 = jsonDecode(response.body);
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
    // print("Response Status = ${response.statusCode}");
    // print("Response Body = ${response.body}");
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
                  style: TextStyle(color: Colors.red),
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
    super.initState();
    getDataSatuBuku();
    getDataSatuBuku2();
    getDataSatuBuku3();
    getDataSatuBuku4();
    getDataListBuku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Detail Buku",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
          centerTitle: true),
      body: Builder(builder: (_) {
        if (responListBook == null ||
            responListBook2 == null ||
            responListBook3 == null ||
            responListBook4 == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return bodyViewBook();
        }
      }),
    );
  }

  Widget bodyViewBook() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black),
                child: Image.network(responListBook!["image"]),
              )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.white,
                      child: Text(
                        responListBook == null
                            ? "data"
                            : responListBook!["title"],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
                    Expanded(
                        child: Text(
                      responListBook == null
                          ? "data"
                          : responListBook!["price"],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      responListBook == null
                          ? "data"
                          : responListBook!["authors"],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ],
                ),
              ))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.blueAccent,
          ),
          child: const Center(
            child: Text(
              "BUY",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            responListBook == null ? "data" : responListBook!["subtitle"],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          height: 100,
          child:
              Text(responListBook == null ? "data" : responListBook!["desc"]),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.black12,
          ),
          child: const Center(
            child: Text(
              "Rekomendasi Bacaan Bagus",
              style:
                  TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 165,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey),
                child: Image.network(responListBook2!["image"]),
              )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey),
                child: Image.network(responListBook3!["image"]),
              )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey),
                child: Image.network(responListBook4!["image"]),
              ))
            ],
          ),
        )
      ],
    );
  }
}
