import 'package:eduvelopeV2/Screens/HomeScreen.dart';
import 'package:eduvelopeV2/Screens/Login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue[900]),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
