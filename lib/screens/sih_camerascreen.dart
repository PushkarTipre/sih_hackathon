import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_hack/screens/sih_login.dart';

class sih_cameraScreen extends StatelessWidget {
  const sih_cameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => sih_Login(),
                ),
              );
            },
            icon: Icon(Icons.exit_to_app),
            color: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
