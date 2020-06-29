import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class CreateClassroom extends StatefulWidget {
  @override
  _CreateClassroomState createState() => _CreateClassroomState();
}

class _CreateClassroomState extends State<CreateClassroom> {
  final TextEditingController classNameController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController standardController = TextEditingController();
  final TextEditingController timingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
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
                        "Class Name",
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
                          controller: classNameController,
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
                            hintText: "eg.Ranker Batch",
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
                        "Subject",
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
                          controller: subjectController,
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
                            hintText: "eg.Mathematics",
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
                        "Standard",
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
                          controller: standardController,
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
                            hintText: "eg.10th",
                          ),
                          keyboardType: TextInputType.number,
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
                        "Timing",
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
                          controller: timingController,
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
                            hintText: "eg.10AM-12PM",
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
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    print(prefs.getString("teacherId"));
                    await Firestore.instance
                        .collection("Teachers")
                        .document(prefs.getString("teacherId"))
                        .collection('Classrooms')
                        .document(classNameController.text)
                        .setData({
                      "className": classNameController.text,
                      "subject": subjectController.text,
                      "standard": int.parse(standardController.text),
                      "timing": timingController.text,
                    }).then((value) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('SUCCESS'),
                              content: Text('CLASSROOM ADDED SUCCESSFULLY'),
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
                      classNameController.clear();
                      subjectController.clear();
                      standardController.clear();
                      timingController.clear();
                    });
                  },
                  child: Text(
                    'Create',
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
