import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'models/api_data.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Center(
              child: Image.asset(
                'assets/images/img.png',
                width: 150,
                height: 83,
              ),
            ),
          ),
          body: const HomePage(),
        ),
      ),
    );
  }
}
