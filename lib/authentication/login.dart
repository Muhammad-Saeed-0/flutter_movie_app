import 'package:flutter/material.dart';
import 'package:movie_app/authentication/signUp.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/pages/home_page.dart';

import '../utilities/text_design.dart';
import '../utilities/buttons.dart';

class LogIn extends StatefulWidget {
  String? signUpUserName, signUpPassword;

  LogIn({Key? key, this.signUpUserName, this.signUpPassword}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var passwordController = TextEditingController();
  var userNameController = TextEditingController();
  final GlobalKey<FormState> _logInKey = GlobalKey<FormState>();
  bool obscureText = true;
  var eye = Icons.visibility;

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
                Form(
                  key: _logInKey,
                  child: Column(
                    children: [
                      Container(
                        width: 270,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            controller: userNameController,
                            cursorColor: Colors.red,
                            decoration: const InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintText: 'Enter Your UserName',
                              icon: Icon(
                                Icons.person_outlined,
                              ),
                            ),
                            validator: (String? value) {
                              if (widget.signUpUserName == null ||
                                  widget.signUpPassword == null) {
                                return "Sign Up first";
                              } else if (value!.isEmpty) {
                                return "UserName must have a value";
                              } else if (value.length < 3) {
                                return "UserName must have a 3 or more character";
                              } else if (value != widget.signUpUserName) {
                                return "UserName Don't match";
                              }
                            },
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
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              cursorColor: Colors.red,
                              obscureText: obscureText,
                              decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: 'Enter Your Password',
                                icon: const Icon(
                                  Icons.lock,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (obscureText) {
                                        obscureText = false;
                                        eye = Icons.visibility_off;
                                      } else {
                                        obscureText = true;
                                        eye = Icons.visibility;
                                      }
                                    });
                                  },
                                  icon: Icon(eye),
                                ),
                              ),
                              validator: (String? value) {
                                if (widget.signUpUserName == null ||
                                    widget.signUpPassword == null) {
                                  return "Sign Up first";
                                } else if (value!.isEmpty) {
                                  return "Password must have a value";
                                } else if (value.length < 6) {
                                  return "Password must have a 6 or more character/numbers";
                                } else if (value != widget.signUpPassword) {
                                  return "Password Don't match";
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
                        child: Buttons(
                          textButton: TextButton(
                            onPressed: () {
                              if (_logInKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return HomePage();
                                    },
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'LogIn',
                              style: TextStyle(fontSize: 20),
                            ),

                            // backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
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
                  child: const Text(
                    "Don't have an account? Sign Up",
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
