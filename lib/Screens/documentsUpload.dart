import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import './docUpload.dart';

class UploadDocuments extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String institute;
  final String email;
  final String password;
  final String mobile;
  UploadDocuments(
      {this.email,
      this.firstname,
      this.institute,
      this.lastname,
      this.mobile,
      this.password});
  @override
  _UploadDocumentsState createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {
  File _pickedImage;

  pickImageCamera() async {
    await ImagePicker.pickImage(
            source: ImageSource.camera, maxHeight: 400, maxWidth: 400)
        .then((image) async {
      setState(() {
        _pickedImage = image;
      });
      /*  final ref = FirebaseStorage.instance
          .ref()
          .child('userProfile')
          .child(widget.id + '.jpg');

      await ref.putFile(image).onComplete; */
    });
  }

  pickImageGallery() async {
    await ImagePicker.pickImage(
            source: ImageSource.gallery, maxHeight: 400, maxWidth: 400)
        .then((image) async {
      setState(() {
        _pickedImage = image;
      });
      /*  final ref = FirebaseStorage.instance
          .ref()
          .child('userProfile')
          .child(widget.id + '.jpg');

      await ref.putFile(image).onComplete; */
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 90),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Upload your Profile Picture',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: null,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: _pickedImage != null
                          ? FileImage(_pickedImage)
                          : AssetImage('assets/user.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Choose'),
                      content: Text('Select a method.'),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            pickImageCamera();
                          },
                          child: Text('Camera'),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            pickImageGallery(); 
                          },
                          child: Text('Gallery'),
                        )
                      ],
                    );
                  },
                );
              },
              child: Text('Upload Image'),
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
                onPressed: () {
                  if (_pickedImage == null) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Please upload a profile picture.'),
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => DocUpload(
                                  email: widget.email,
                                  firstname: widget.firstname,
                                  institute: widget.institute,
                                  lastname: widget.lastname,
                                  mobile: widget.mobile,
                                  password: widget.password,
                                  profilepic: _pickedImage,
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
            )
          ],
        ),
      ),
    );
  }
}
