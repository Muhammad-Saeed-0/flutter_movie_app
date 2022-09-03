import 'package:flutter/material.dart';
import 'package:movie_app/authentication/signUp.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/pages/home_page.dart';

import '../utilities/text_design.dart';
import 'buttons.dart';

class LogIn extends StatefulWidget {
  String? userName, password;

  LogIn({Key? key, this.userName, this.password}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
                        'assets/images/1.jpg',
                        height: 220,
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
                        hintText: 'Enter Your UserName',
                        icon: Icon(
                          Icons.person_outlined,
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
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
                  child: Buttons(
                    textButton: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
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
                ),
                TextButton(
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
                  child: Text(
                    "Dont't have an account? Sign Up",
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
