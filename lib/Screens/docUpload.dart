import 'dart:io';

import 'package:eduvelopeV2/Screens/Login.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DocUpload extends StatefulWidget {
  final String id;
  DocUpload({this.id});
  @override
  _DocUploadState createState() => _DocUploadState();
}

class _DocUploadState extends State<DocUpload> {
  File _pickedImage;
  pickImage() async {
    await ImagePicker.pickImage(source: ImageSource.camera).then((image) async {
      setState(() {
        _pickedImage = image;
      });
      final ref = FirebaseStorage.instance
          .ref()
          .child('userDocs')
          .child(widget.id + '.jpg');

      await ref.putFile(image).onComplete;
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
              'Tap to Upload your Profile Picture',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                pickImage();
              },
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
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Login()));
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
