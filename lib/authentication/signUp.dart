import 'package:flutter/material.dart';
import 'package:movie_app/authentication/login.dart';
import 'package:movie_app/utilities/text_design.dart';

import '../main.dart';
import 'buttons.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return MyApp(
      displayWidget: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/4.png',
                        height: 220,
                        width: 300,
                      ),
                      TextDesign(text: "Enjoy With Us 😈"),
                    ],
                  ),
                ),
                Container(
                  width: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: TextField(
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: 'Enter Your Email',
                        icon: Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: TextField(
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: 'Enter Your UserName',
                          icon: Icon(
                            Icons.person_outlined,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: TextField(
                      cursorColor: Colors.red,
                      obscureText: true,
                      decoration: InputDecoration(
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: 'Enter Your Password',
                        icon: Icon(
                          Icons.lock,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Buttons(
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
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      ),

                      // backgroundColor: Colors.white,
                    ),
                  ),
                ),
                TextButton(
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
                    "Do you have an account? LogIn",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
