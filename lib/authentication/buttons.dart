import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  Widget? textButton;
  Buttons({Key? key, required this.textButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        color: Colors.red,
        width: 260,
        child: Card(
          child: textButton!,
        ),
      ),
    );
  }
}
