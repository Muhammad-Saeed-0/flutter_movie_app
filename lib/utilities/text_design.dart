import 'package:flutter/material.dart';

class TextDesign extends StatelessWidget {
  late Color color;
  late double size;
  late String text;

  TextDesign({Key? key, required this.text}) : super(key: key) {
    color = const Color.fromRGBO(255, 0, 0, 1);
    size = 26;
  }

  TextDesign.subTitle({Key? key, required this.text}) : super(key: key) {
    size = 18;

    if (text != 'No Title') {
      color = Colors.white;
    } else {
      color = Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'BreeSerif',
      ),
    );
  }
}
