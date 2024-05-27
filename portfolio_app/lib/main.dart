import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      'https://randomuser.me/api/portraits/men/4.jpg'),
                )),
          )
        ],
        title: Container(
          height: 45,
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                ),
                hintText: 'Search for',
                hintStyle: TextStyle(color: Colors.grey.shade400)),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      ),
    );
  }
}
