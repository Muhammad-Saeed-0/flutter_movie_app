import 'package:flutter/material.dart';
import 'package:movie_app/authentication/welcome.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'models/api_data.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget? displayWidget;
  MyApp({Key? key, this.displayWidget}) : super(key: key) {
    displayWidget ??= Welcome();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            // leading: Icon(
            //   Icons.menu,
            //   color: Colors.white,
            // ),
            backgroundColor: Colors.red,
            title: Center(
              // widthFactor: 1.8,
              child: Image.asset(
                'assets/images/img.png',
                width: 150,
                height: 83,
              ),
            ),
          ),
          body: displayWidget,
        ),
      ),
    );
  }
}
