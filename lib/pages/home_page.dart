import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/bookdetail");
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),
              child: const Text(
                "Lihat Detail Buku",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
        ));
  }
}
