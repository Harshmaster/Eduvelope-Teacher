import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'documentsUpload.dart';

class TempSignup extends StatefulWidget {
  @override
  _TempSignupState createState() => _TempSignupState();
}

class _TempSignupState extends State<TempSignup> {
  bool _loading = false;
  @override
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController instituteController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Image.asset('assets/logo.png')),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 10,
                                ),
                                child: Text(
                                  "First Name",
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
                                    controller: firstNameController,
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
                                      hintText: "eg.harsh",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 10,
                                ),
                                child: Text(
                                  "Last Name",
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
                                    controller: lastNameController,
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
                                      hintText: "eg.Kumar",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 10, top: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: Text(
                              "Institute Name",
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
                                controller: instituteController,
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
                                  hintText: "eg.NSUT",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10,
                                  ),
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
                                      dragStartBehavior:
                                          DragStartBehavior.start,
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
                                        hintText: "eg.abc@123",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: Text(
                                    "Confirm Password",
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
                                      controller: confirmPasswordController,
                                      enabled: true,
                                      maxLengthEnforced: true,
                                      minLines: 1,
                                      cursorColor: Colors.black,
                                      cursorWidth: 1,
                                      dragStartBehavior:
                                          DragStartBehavior.start,
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
                                        hintText: "abc@123",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: Text(
                                    "Mobile",
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
                                      controller: mobileController,
                                      enabled: true,
                                      maxLengthEnforced: true,
                                      minLines: 1,
                                      cursorColor: Colors.black,
                                      cursorWidth: 1,
                                      dragStartBehavior:
                                          DragStartBehavior.start,
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
                                        hintText: "eg.9871511555",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: Text(
                                    "Email",
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
                                      dragStartBehavior:
                                          DragStartBehavior.start,
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
                                        hintText: "harsh@gmail.com",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 45,
                      margin: EdgeInsets.only(
                        top: 25,
                        left: 20,
                        right: 20,
                        bottom: 10,
                      ),
                      width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.blue[900],
                        onPressed: () async {
                          setState(() {
                            _loading = true;
                          });
                          var firstname = firstNameController.text;
                          var lastname = lastNameController.text;
                          var institute = instituteController.text;
                          var password = passwordController.text;
                          var cnf = confirmPasswordController.text;
                          var mobile = mobileController.text;
                          var email = emailController.text;
                          if (firstname.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Name is required!!!'),
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
                          } else if (institute.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Institue name is required'),
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
                          } else if (password.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Password is required.'),
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
                          } else if (cnf != password) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text(
                                      'Confirm password and password do not match.'),
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
                          } else if (mobile.isEmpty || mobile.length != 10) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text(
                                      'Please enter a valid mobile number.'),
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
                          } else if (email.isEmpty ||
                              !email.contains('@') ||
                              !email.contains('.com')) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Please enter a valid email'),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        UploadDocuments(
                                          email: email,
                                          firstname: firstname,
                                          institute: institute,
                                          lastname: lastname,
                                          mobile: mobile,
                                          password: password,
                                        )));
                          }
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
