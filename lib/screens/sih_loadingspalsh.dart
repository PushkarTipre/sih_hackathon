import 'package:flutter/material.dart';

class sih_loadingSplash extends StatefulWidget {
  const sih_loadingSplash({super.key});

  @override
  State<sih_loadingSplash> createState() => _sih_loadingSplashState();
}

class _sih_loadingSplashState extends State<sih_loadingSplash> {
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  void _loadData() {
    Future.delayed(Duration(seconds: 2)); // Simulating a 5-second delay
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
            : null);
  }
}
