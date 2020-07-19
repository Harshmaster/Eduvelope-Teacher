import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SendPassResetBtn extends StatefulWidget {
  final String email;
  final TextEditingController emailController;
  SendPassResetBtn({this.email, this.emailController});
  @override
  _SendPassResetBtnState createState() => _SendPassResetBtnState();
}

class _SendPassResetBtnState extends State<SendPassResetBtn> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        if (!widget.email.contains('.com') || !widget.email.contains('@')) {
          Navigator.of(context).pop();
          widget.emailController.clear();
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid Email'),
              duration: Duration(seconds: 3),
            ),
          );
        }
        FirebaseAuth.instance
            .sendPasswordResetEmail(email: widget.email)
            .then((v) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Email sent to ${widget.email.trim()} '),
              duration: Duration(seconds: 3),
            ),
          );
          widget.emailController.clear();
          Navigator.of(context).pop();
        });
      },
      child: Text('OK'),
    );
  }
}
