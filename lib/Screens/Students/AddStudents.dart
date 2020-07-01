import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduvelopeV2/Screens/Students/localData.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class AddStudents extends StatefulWidget {
  final String className;
  final int standard;
  AddStudents({this.className, this.standard});

  @override
  _AddStudentsState createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
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
      child: Container(
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
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                      currentClassStudents.add(uid);

                  await Firestore.instance.collection("Students").add({
                    "uniqueID" : uid,
                    "studentName": nameController.text,
                    "email": emailController.text,
                    "mobile": int.parse(mobileController.text),
                    "studentId": studentIDController.text,
                    "studentFees": feesController.text,
                    "feesDate": feesDateController.text,
                    'standard' : widget.standard,
                    'classname' : widget.className,
                  });

                  await Firestore.instance
                      .collection("Classrooms")
                      .document(widget.className)
                      .updateData({
                        'students' : currentClassStudents,
                  }).then((value) async {
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
