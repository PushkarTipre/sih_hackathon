import 'package:flutter/material.dart';

class signupSignInPageLogo extends StatelessWidget {
  const signupSignInPageLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
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
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
