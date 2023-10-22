import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_hack/reuseableWidgets/user_imagepicker.dart';
import 'package:sih_hack/screens/sih_camerascreen.dart';
import 'package:sih_hack/screens/sih_signup.dart';
import '../reuseableWidgets/reuseableButtons.dart';
import '../reuseableWidgets/reuseable_list_tile.dart';
import '../reuseableWidgets/reuseableTextField.dart';

final _firebase = FirebaseAuth.instance;

class sih_Login extends StatefulWidget {
  const sih_Login({super.key});

  @override
  State<sih_Login> createState() => _sih_LoginState();
}

class _sih_LoginState extends State<sih_Login> {
  var _isLogin = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _submit() async {
    try {
      if (_isLogin) {
        await _firebase.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => sih_user_ImagePicker(),
          ),
        );
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'Wrong info') {
        //..
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid Login Details. Login Failed'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Form(
            child: Center(
              child: Column(
                children: [
                  Hero(
                    tag: 'mainLogo',
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: -10,
                          blurRadius: 20,
                          offset: Offset(0, 6),
                        )
                      ]),
                      child: Image.asset(
                        'assets/images/logoOG.png',
                        height: 250,
                        width: 250,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0),
                        ),
                        color: Color(0xFFFF602E),
                      ),
                      child: ListView(children: [
                        ListTile(
                          title: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Center(
                            child: Text(
                              'Enter your acount details',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        reuseableListTile(textTile: 'Enter your Email :'),
                        reuseableTextField(
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            save: (value) {},
                            controller: _emailController,
                            text: 'Enter your Email',
                            icon: Icons.mail,
                            isPassword: false),
                        reuseableListTile(textTile: 'Enter your Password :'),
                        reuseableTextField(
                            validator: (value) {},
                            save: (value) {},
                            controller: _passwordController,
                            text: 'Enter your Password',
                            icon: Icons.lock,
                            isPassword: true),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.fromLTRB(68, 0, 0, 0),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        reuseableLoginSignupButtonMain(
                            label: 'Login', changeScreen: _submit),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have a account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            reuseableLoginSignupButton(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                label: 'SignUp',
                                changeScreen: () {
                                  _isLogin = true;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => sih_signUp(),
                                    ),
                                  );
                                })
                          ],
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
