import 'package:flutter/material.dart';
import 'package:movie_app/authentication/login.dart';
import 'package:movie_app/authentication/signUp.dart';
import 'package:movie_app/utilities/text_design.dart';

import 'buttons.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/5.jpg',
                  width: 250,
                  height: 300,
                ),
                TextDesign(text: "Welcome, Welcome"),
              ],
            ),
          ),
          Buttons(
            textButton: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LogIn();
                    },
                  ),
                );
              },
              child: const Text(
                'LogIn',
                style: TextStyle(fontSize: 20),
              ),
              // backgroundColor: Colors.white,
            ),
          ),
          Buttons(
            textButton: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUp();
                    },
                  ),
                );
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 20),
              ),
              // backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
