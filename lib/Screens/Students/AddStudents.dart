import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduvelopeV2/Screens/Students/localData.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../AllClassrooms.dart';

class AddStudents extends StatefulWidget {
  final String id;
  final String className;
  final int standard;
  AddStudents({this.className, this.standard, this.id});

  @override
  _AddStudentsState createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  bool _loading = false;
  var uuid = Uuid();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController studentIDController = TextEditingController();
  final TextEditingController studentLiveClassIDController =
      TextEditingController();
  final TextEditingController feesController = TextEditingController();
  final TextEditingController feesDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
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
                            "Name",
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
                              controller: nameController,
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
                                hintText: "eg.Harsh Singh",
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
                                hintText: "eg.abc@gmail.com",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2.4,
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 15,
                          top: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
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
                                    hintText: "eg.9871511555",
                                  ),
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        margin: EdgeInsets.only(
                          left: 0,
                          right: 29,
                          top: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Student ID",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
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
                                  controller: studentLiveClassIDController,
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
                                    hintText: "Enter ID",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: <Widget>[
                      /* Container(
                        width: MediaQuery.of(context).size.width / 2.4,
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 15,
                          top: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "STUDENT LIVE CLASS ID",
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
                                  controller: studentIDController,
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
                                    hintText: "Enter ID",
                                  ),
                                  // keyboardType: TextInputType.number,
                                  // maxLength: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ), */
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        margin: EdgeInsets.only(
                          left: 0,
                          right: 29,
                          top: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Student Fees",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
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
                                  controller: feesController,
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
                                    hintText: "Enter Fees",
                                  ),
                                  keyboardType: TextInputType.number,
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
                    margin: EdgeInsets.only(
                      left: 15,
                      right: 29,
                      top: 20,
                      bottom: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Fees Date",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
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
                              controller: feesDateController,
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
                                hintText: "eg.DD/MM/YYYY",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 45,
                    margin: EdgeInsets.only(
                      top: 0,
                      left: 20,
                      right: 20,
                      bottom: 30,
                    ),
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.blue[900],
                      onPressed: () async {
                        var uid = uuid.v4();
                        var studentName = nameController.text;
                        var email = emailController.text;
                        var mobile = mobileController.text;
                        var studentid = studentLiveClassIDController.text;
                        var studentfee = feesController.text;
                        var date = feesDateController.text;

                        if (studentName.isEmpty ||
                            studentid.isEmpty ||
                            studentfee.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text('All feilds are required.'),
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
                            !email.contains('.com') ||
                            !email.contains('@')) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content:
                                    Text('Please enter a valid email address'),
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
                                content:
                                    Text('Please enter a valid mobile number.'),
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
                        } else if (date.isEmpty ||
                            date.length > 10 ||
                            !date.contains('/') ||
                            date.length < 8) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text(
                                    'Enter a valid date. Format: dd/mm/yyyy'),
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
                          setState(() {
                            _loading = true;
                          });
                          currentClassStudents.add(uid);
                          await Firestore.instance.collection("Students").add({
                            "uniqueID": uid,
                            "classID": widget.id,
                            "studentName": nameController.text,
                            "email": emailController.text,
                            "mobile": int.parse(mobileController.text),
                            "studentId": studentIDController.text,
                            "studentFees": feesController.text,
                            "feesDate": feesDateController.text,
                            'standard': widget.standard,
                            'classname': widget.className,
                          }).then((v) {
                            Firestore.instance
                                .collection("Classrooms")
                                .where('uid', isEqualTo: widget.id)
                                .getDocuments()
                                .then((value) {
                              value.documents.forEach((element) {
                                element.reference.updateData({
                                  'students': currentClassStudents,
                                });
                              });
                            });
                          }).then((v) {
                            print('DONE');
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('SUCCESS'),
                                    content: Text('STUDENT ADDED SUCCESSFULLY'),
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
                                });
                            nameController.clear();
                            emailController.clear();
                            mobileController.clear();
                            studentIDController.clear();
                            studentLiveClassIDController.clear();
                            feesController.clear();
                            feesDateController.clear();
                          });
                        }
                      },
                      child: Text(
                        'ADD STUDENT',
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
    ));
  }
}
