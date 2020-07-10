import 'package:eduvelopeV2/Screens/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './Screens/docUpload.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/TempLogin.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue[900]),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue[900]),
      home: StreamBuilder(
        builder: (context, authSnapshot) {
          if (authSnapshot.hasData) {
            return HomeScreen(mobile: false,);
          } else {
            return TempLogin();
          }
        },
        stream: FirebaseAuth.instance.onAuthStateChanged,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
