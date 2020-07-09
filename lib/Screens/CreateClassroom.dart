import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduvelopeV2/globalData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../globalData.dart';
import '../globalData.dart';

class CreateClassroom extends StatefulWidget {
  @override
  _CreateClassroomState createState() => _CreateClassroomState();
}

class _CreateClassroomState extends State<CreateClassroom> {
  bool _loading = false;
  var uuid = Uuid();
  SharedPreferences prefs;
  String teacherID;
  int startTiming;
  int startSuffix = 1;
  int endTiming;
  int endSuffix = 1;
  getTeacherId() async {
    prefs = await SharedPreferences.getInstance();
    teacherID = prefs.getString("teacherId");
    return prefs.getString("teacherId");
  }

  final TextEditingController classNameController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController standardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'Start Timing',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: DropdownButton(
                              isExpanded: false,
                              value: startTiming,
                              hint: Text("Start Timing"),
                              items: [
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('1'),
                                    ],
                                  ),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('2'),
                                    ],
                                  ),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('3'),
                                    ],
                                  ),
                                  value: 3,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('4'),
                                    ],
                                  ),
                                  value: 4,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('5'),
                                    ],
                                  ),
                                  value: 5,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('6'),
                                    ],
                                  ),
                                  value: 6,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('7'),
                                    ],
                                  ),
                                  value: 7,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('8'),
                                    ],
                                  ),
                                  value: 8,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('9'),
                                    ],
                                  ),
                                  value: 9,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('10'),
                                    ],
                                  ),
                                  value: 10,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('11'),
                                    ],
                                  ),
                                  value: 11,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('12'),
                                    ],
                                  ),
                                  value: 12,
                                ),
                              ],
                              onChanged: (whatwaspressed) {
                                setState(() {
                                  startTiming = whatwaspressed;
                                });
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DropdownButton(
                            value: startSuffix,
                            hint: Text("AM"),
                            items: [
                              DropdownMenuItem(
                                child: Row(
                                  children: <Widget>[
                                    Text('AM'),
                                  ],
                                ),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: <Widget>[
                                    Text('PM'),
                                  ],
                                ),
                                value: 2,
                              ),
                            ],
                            onChanged: (whatwaspressed) {
                              setState(() {
                                startSuffix = whatwaspressed;
                              });
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'End Timing',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: DropdownButton(
                              isExpanded: false,
                              value: endTiming,
                              hint: Text("End Timing"),
                              items: [
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('1'),
                                    ],
                                  ),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('2'),
                                    ],
                                  ),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('3'),
                                    ],
                                  ),
                                  value: 3,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('4'),
                                    ],
                                  ),
                                  value: 4,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('5'),
                                    ],
                                  ),
                                  value: 5,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('6'),
                                    ],
                                  ),
                                  value: 6,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('7'),
                                    ],
                                  ),
                                  value: 7,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('8'),
                                    ],
                                  ),
                                  value: 8,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('9'),
                                    ],
                                  ),
                                  value: 9,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('10'),
                                    ],
                                  ),
                                  value: 10,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('11'),
                                    ],
                                  ),
                                  value: 11,
                                ),
                                DropdownMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('12'),
                                    ],
                                  ),
                                  value: 12,
                                ),
                              ],
                              onChanged: (whatwaspressed) {
                                setState(() {
                                  endTiming = whatwaspressed;
                                });
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DropdownButton(
                            value: endSuffix,
                            hint: Text("AM"),
                            items: [
                              DropdownMenuItem(
                                child: Row(
                                  children: <Widget>[
                                    Text('AM'),
                                  ],
                                ),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Row(
                                  children: <Widget>[
                                    Text('PM'),
                                  ],
                                ),
                                value: 2,
                              ),
                            ],
                            onChanged: (whatwaspressed) {
                              setState(() {
                                endSuffix = whatwaspressed;
                              });
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(
                    //     left: 20,
                    //     right: 29,
                    //     top: 20,
                    //   ),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Container(
                    //         margin: EdgeInsets.only(bottom: 10),
                    //         child: Text(
                    //           "Start Timing",
                    //           style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(40),
                    //         ),
                    //         child: ClipRRect(
                    //           borderRadius: BorderRadius.circular(10),
                    //           child: TextField(
                    //             controller: startTimingController,
                    //             enabled: true,
                    //             maxLengthEnforced: true,
                    //             minLines: 1,
                    //             cursorColor: Colors.black,
                    //             cursorWidth: 1,
                    //             dragStartBehavior: DragStartBehavior.start,
                    //             decoration: InputDecoration(
                    //               fillColor: Colors.grey[200],
                    //               filled: true,
                    //               labelStyle: TextStyle(
                    //                 color: Colors.black,
                    //                 fontSize: 17,
                    //                 fontWeight: FontWeight.w700,
                    //               ),
                    //               enabledBorder: InputBorder.none,
                    //               focusedBorder: InputBorder.none,
                    //               hintStyle: TextStyle(
                    //                 color: Colors.grey,
                    //                 fontSize: 17,
                    //               ),
                    //               hintText: "eg.1630",
                    //             ),
                    //             keyboardType: TextInputType.number,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    /* Container(
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
                        "End Timing",
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
                          controller: endTimingController,
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
                            hintText: "eg.1830",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
              ), */
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
                          var standard = standardController.text;
                          var className = classNameController.text;
                          var subject = subjectController.text;

                          if (className.isEmpty ||
                              subject.isEmpty ||
                              standard.isEmpty ||
                              startTiming == null ||
                              endTiming == null) {
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
                            var uid = uuid.v4();
                            int finalStart;
                            if (startSuffix == 1) {
                              finalStart = (startTiming * 100);
                            } else {
                              finalStart = ((12 + startTiming) * 100);
                            }

                            int finalEnd;
                            if (endSuffix == 1) {
                              finalEnd = (endTiming * 100);
                            } else {
                              finalEnd = ((12 + endTiming) * 100);
                            }

                            print('creating');
                            currentTeacherClassrooms
                                .add(uid);

                            String finalStartSuffix;
                            String finalEndSuffix;
                            if (startSuffix == 1) {
                              finalStartSuffix = "Am";
                            } else {
                              finalStartSuffix = "Pm";
                            }

                            if (endSuffix == 1) {
                              finalEndSuffix = "Am";
                            } else {
                              finalEndSuffix = "Pm";
                            }
                            await Firestore.instance
                                .collection('Teachers')
                                .document(currentTeacherId)
                                .updateData({
                              'classrooms': currentTeacherClassrooms,
                            }).then((v) {
                              Firestore.instance
                                  .collection("Classrooms")
                                  .add({
                                "active": false,
                                "uid" : uid,
                                "className": classNameController.text,
                                "subject": subjectController.text,
                                "standard": int.parse(standardController.text),
                                'startTiming': finalStart,
                                'endTiming': finalEnd,
                                'start': '$startTiming $finalStartSuffix',
                                'end': '$endTiming $finalEndSuffix',
                                "teacherID": currentTeacherId,
                                'students': [],
                              });
                            }).then((v) {
                              setState(() {
                                _loading = false;
                              });
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('SUCCESS'),
                                      content:
                                          Text('CLASSROOM ADDED SUCCESSFULLY'),
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
                            });
                          }
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
