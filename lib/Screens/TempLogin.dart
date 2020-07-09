import 'package:eduvelopeV2/Screens/TempSignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../globalData.dart';
import '../globalData.dart';

class TempLogin extends StatefulWidget {
  @override
  _TempLoginState createState() => _TempLoginState();
}

class _TempLoginState extends State<TempLogin> {
  bool _loading = false;
  AuthResult _authResult;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset('assets/logo.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 29,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Username",
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
                                controller: userNameController,
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
                                  hintText: "Enter Email",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 29,
                        top: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Password",
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
                                controller: passwordController,
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
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30, top: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          // Checkbox(
                          //     activeColor: Colors.blue[900],
                          //     value: toKeepLoggedIn,
                          //     onChanged: (isSelected) {
                          //       toKeepLoggedIn = isSelected;

                          //       setState(() {});
                          //     }),
                          // Text(
                          //   'Keep Me Logged In',
                          //   style: TextStyle(fontWeight: FontWeight.w500),
                          // ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                      height: 45,
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.blue[900],
                        onPressed: () async {
                          var email = userNameController.text;
                          var password = passwordController.text;
                          if (!email.contains('.com') || !email.contains('@')) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Invalid Email.'),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    )
                                  ],
                                );
                              },
                            );
                          } else {
                            setState(() {
                              _loading = true;
                            });
                            try {
                              _authResult = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email, password: password);

                              currentTeacherId = _authResult.user.uid;                
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
                            setState(() {
                              _loading = false;
                            });
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                        bottom: 70,
                      ),
                      width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.blue[900])),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TempSignup()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
