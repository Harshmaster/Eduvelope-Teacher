import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _loading = false;
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Forgot Password'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                "Enter Email",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextField(
                  controller: emailController,
                  enabled: true,
                  maxLengthEnforced: true,
                  minLines: 1,
                  cursorColor: Colors.black,
                  cursorWidth: 1,
                  dragStartBehavior: DragStartBehavior.start,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                    hintText: "Enter Password",
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _loading = true;
                });
                var email = emailController.text;
                if (!email.contains('.com') || !email.contains('@')) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please provide a valid email id.'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                _loading = false;
                              });
                            },
                            child: Text('OK'),
                          )
                        ],
                      );
                    },
                  );
                } else {
                  try {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email,)
                        .then((v) {
                      Firestore.instance
                          .collection('Teachers')
                          .where('email', isEqualTo: email)
                          .getDocuments()
                          .then((v) {
                        v.documents.forEach((element) {
                          element.reference.updateData({});
                        });
                      });
                    }).then((v) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Success'),
                            content:
                                Text('Password reset email has been sent.'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  emailController.clear();
                                  Navigator.of(context).pop();
                                  setState(() {
                                    _loading = false;
                                  });
                                },
                                child: Text('OK'),
                              ),
                              FlatButton(
                                onPressed: () {
                                  emailController.clear();
                                  Navigator.of(context).pop();
                                  setState(() {
                                    _loading = false;
                                  });
                                },
                                child: Text('Go to Login Screen.'),
                              ),
                            ],
                          );
                        },
                      );
                    });
                  } catch (err) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text(err.message),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  _loading = false;
                                });
                              },
                              child: Text('OK'),
                            )
                          ],
                        );
                      },
                    );
                  }
                }
              },
              child: _loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
