import 'package:eduvelopeV2/Screens/Signup.dart';
import 'package:eduvelopeV2/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import './Screens/docUpload.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue[900]),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
