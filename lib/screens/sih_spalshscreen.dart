import 'package:flutter/material.dart';
import 'package:sih_hack/screens/sih_signup.dart';

class sih_SplashScreen extends StatefulWidget {
  const sih_SplashScreen({super.key});

  @override
  State<sih_SplashScreen> createState() => _sih_SplashScreenState();
}

class _sih_SplashScreenState extends State<sih_SplashScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating a 5-second delay
    setState(() {
      _isLoading = false; // Set isLoading to false after the delay
    });
    // Perform any necessary initialization here
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isLoading
          ? Image.asset(
              'assets/images/bigLogo.png',
              fit: BoxFit.fill,
            ) // Your splash screen image
          : sih_signUp(),
    );
  }
}
