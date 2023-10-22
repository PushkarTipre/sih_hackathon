import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../reuseableWidgets/reuseableButtons.dart';
import '../reuseableWidgets/reuseableTextField.dart';
import '../reuseableWidgets/reuseable_list_tile.dart';
import '../reuseableWidgets/signinloginPageLogo.dart';
import 'sih_login.dart';

final _firebase = FirebaseAuth.instance;

class sih_signUp extends StatefulWidget {
  const sih_signUp({super.key});

  @override
  State<sih_signUp> createState() => _sih_signUpState();
}

class _sih_signUpState extends State<sih_signUp> {
  var _isLogin = true;
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _reEnterPassword = TextEditingController();

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    try {
      final userCred = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => sih_Login()));
      print(userCred);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        //..
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication Failed'),
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
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: signupSignInPageLogo(),
                ),
                Expanded(
                  child: Scrollbar(
                    trackVisibility: true,
                    thumbVisibility: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFF602E),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0),
                        ),
                      ),
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 15.0,
                          ),
                          ListTile(
                            title: Center(
                              child: Text(
                                'Sign Up',
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
                                'Enter your details',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ),
                          ),
                          reuseableListTile(textTile: 'Enter Name *'),
                          reuseableTextField(
                            validator: (value) {},
                            save: (value) {},
                            controller: _nameController,
                            text: 'Full Name',
                            icon: Icons.person,
                            isPassword: false,
                          ),
                          reuseableListTile(textTile: 'Enter Email *'),
                          reuseableTextField(
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            save: (value) {
                              _enteredEmail = value!;
                            },
                            controller: _emailController,
                            text: 'Enter Email',
                            icon: Icons.mail,
                            isPassword: false,
                          ),
                          reuseableListTile(textTile: 'Enter Password *'),
                          reuseableTextField(
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return 'Password must be 6 characters long';
                              }
                              return null;
                            },
                            save: (value) {
                              _enteredPassword = value!;
                            },
                            controller: _passwordController,
                            text: 'Enter Password',
                            icon: Icons.lock,
                            isPassword: true,
                          ),
                          reuseableListTile(
                            textTile: 'Re-enter Password *',
                          ),
                          reuseableTextField(
                            validator: (value) {},
                            save: (value) {},
                            controller: _reEnterPassword,
                            text: 'Re-enter Password',
                            icon: Icons.lock_outline_rounded,
                            isPassword: true,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          reuseableLoginSignupButtonMain(
                              label: 'Signup', changeScreen: _submit),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already Have a Account?',
                                style: TextStyle(color: Colors.white),
                              ),
                              reuseableLoginSignupButton(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                label: 'Login',
                                changeScreen: () {
                                  _isLogin = false;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => sih_Login(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
