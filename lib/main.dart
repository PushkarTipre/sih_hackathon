import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sih_hack/firebase_options.dart';
import 'package:sih_hack/screens/sih_camerascreen.dart';
import 'package:sih_hack/screens/sih_login.dart';
import 'package:sih_hack/screens/sih_loadingspalsh.dart';
import 'package:sih_hack/screens/sih_spalshscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const sih_mainScreen());
}

class sih_mainScreen extends StatelessWidget {
  const sih_mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return sih_loadingSplash();
            }
            if (snapshot.hasData) {
              return sih_cameraScreen();
            }

            return sih_Login();
          }),
    );
  }
}
