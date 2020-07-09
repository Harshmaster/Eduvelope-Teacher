import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';

class DocUpload extends StatefulWidget {
  final File profilepic;
  final String firstname;
  final String lastname;
  final String institute;
  final String email;
  final String password;
  final String mobile;
  DocUpload(
      {this.email,
      this.firstname,
      this.institute,
      this.lastname,
      this.mobile,
      this.password,
      this.profilepic});
  @override
  _DocUploadState createState() => _DocUploadState();
}

class _DocUploadState extends State<DocUpload> {
  bool _loading = false;
  AuthResult _authResult;
  File _pickedImage;
  pickImage() async {
    await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 400,
      maxHeight: 400,
    ).then((image) async {
      setState(() {
        _pickedImage = image;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10,),
                  Text('Creating User... '),
                  SizedBox(height: 10,),
                  Text('It might take some time depending on your internet connection'),
                ],
              ),
            )
          : Container(
              margin: EdgeInsets.only(top: 90),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Tap to Upload your Aadhar document',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      pickImage();
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: _pickedImage != null
                                ? FileImage(_pickedImage)
                                : AssetImage('assets/document.png'),
                            fit: BoxFit.cover),
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
                      color: Colors.blue[900],
                      onPressed: () async {
                        setState(() {
                          _loading = true;
                        });
                        if (_pickedImage == null) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content:
                                    Text('Please provide a document picture.'),
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
                            _authResult = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: widget.email,
                                    password: widget.password);

                            Firestore.instance
                                .collection('Teachers')
                                .document(_authResult.user.uid)
                                .setData({
                              "firstName": widget.firstname,
                              "lastName": widget.lastname,
                              "Institute": widget.institute,
                              "password": widget.password,
                              "mobile": widget.mobile,
                              "email": widget.email,
                              "teacherId": _authResult.user.uid,
                              "classrooms": [],
                            });
                            final ref = FirebaseStorage.instance
                                .ref()
                                .child('userDocs')
                                .child(_authResult.user.uid + '.jpg');

                            await ref.putFile(_pickedImage).onComplete;
                            final refd = FirebaseStorage.instance
                                .ref()
                                .child('userPic')
                                .child(_authResult.user.uid + '.jpg');

                            await refd.putFile(widget.profilepic).onComplete;
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MyApp()));
                        }
                      },
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
