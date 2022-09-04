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
  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
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
                        'assets/images/4.png',
                        height: 220,
                        width: 300,
                      ),
                      TextDesign(text: "Find Your Story 😈"),
                    ],
                  ),
                ),
                Form(
                  key: _signUpKey,
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
                            controller: emailController,
                            cursorColor: Colors.red,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintText: 'Enter Your Email',
                              icon: Icon(
                                Icons.email,
                              ),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Email must have a value";
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
                                if (value!.isEmpty) {
                                  return "UserName must have a value";
                                } else if (value.length < 3) {
                                  return "UserName must have a 3 or more character";
                                }
                              },
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
                              if (value!.isEmpty) {
                                return "Password must have a value";
                              } else if (value.length < 6) {
                                return "Password must have a 6 or more character/numbers";
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Buttons(
                          textButton: TextButton(
                            onPressed: () {
                              if (_signUpKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LogIn(
                                        signUpUserName: userNameController.text,
                                        signUpPassword: passwordController.text,
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'Sign Up',
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
