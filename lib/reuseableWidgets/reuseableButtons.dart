import 'package:flutter/material.dart';
import 'package:sih_hack/screens/sih_login.dart';

class reuseableLoginSignupButton extends StatelessWidget {
  reuseableLoginSignupButton(
      {required this.label, required this.changeScreen, required this.margin});
  String label;
  Function changeScreen;
  EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeScreen();
      },
      child: Container(
        margin: margin,
        height: 35.0,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.elliptical(50, 50),
              bottomLeft: Radius.elliptical(50, 50)),
          color: Colors.white.withOpacity(0.6),
        ),
        child: Center(child: Text(label)),
      ),
    );
  }
}

class reuseableLoginSignupButtonMain extends StatelessWidget {
  reuseableLoginSignupButtonMain(
      {required this.label, required this.changeScreen});
  String label;
  Function changeScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeScreen();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.elliptical(50, 50),
              bottomRight: Radius.elliptical(50, 50)),
          color: Colors.white.withOpacity(0.3),
        ),
        margin: EdgeInsets.symmetric(horizontal: 80),
        height: 40.0,
        width: double.infinity,
        child: Center(
            child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
