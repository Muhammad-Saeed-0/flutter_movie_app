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
      home: HomePage(),
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
    );
  }
}

//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//       theme: ThemeData(
//         // Define the default brightness and colors.
//         brightness: Brightness.dark,
//         primaryColor: Colors.lightBlue[800],
//
//         // Define the default font family.
//         fontFamily: 'Georgia',
//
//         // Define the default `TextTheme`. Use this to specify the default
//         // text styling for headlines, titles, bodies of text, and more.
//         textTheme: const TextTheme(
//           headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
//           headline6: TextStyle(
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 4,
//           ),
//           bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
//         ),
//       ),
//     );
//   }
// }
