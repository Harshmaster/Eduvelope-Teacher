import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduvelopeV2/Screens/Students/StudentsTabBar.dart';
import 'package:eduvelopeV2/Screens/Students/localData.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../globalData.dart';
import '../globalData.dart';
import '../globalData.dart';

class ClassroomListWidget extends StatefulWidget {
  final String id;
  final String name;
  final int standard;
  final String endTiming;
  final String startTiming;
  final int numOfStudents;

  ClassroomListWidget({
    this.id,
    this.name,
    this.standard,
    this.endTiming,
    this.startTiming,
    this.numOfStudents,
  });

  @override
  _ClassroomListWidgetState createState() => _ClassroomListWidgetState();
}

class _ClassroomListWidgetState extends State<ClassroomListWidget> {
  bool _loading = false;
  int startTime;
  int endTime;
  String totalStartTime;
  String totalEndTime;

  // formatTime() {
  //   startTime = widget.startTiming;
  //   endTime = widget.endTiming;

  //   if ((startTime / 100) > 12) {
  //     int startTimeHours = (startTime / 100).round() - 12;
  //     int startTimeMinutes = startTime % 100;
  //     totalStartTime = "$startTimeHours:$startTimeMinutes";
  //     print(totalStartTime);
  //   } else {
  //     int startTimeHour = (startTime / 100).round();
  //     int startTimeMinutes = startTime % 100;
  //     // if (startTimeMinutes == 0) {
  //     //   startTimeMinutes = 00;
  //     // }
  //     totalStartTime = "$startTimeHour: ${startTimeMinutes}";
  //     print(totalStartTime);
  //   }

  //   if ((endTime / 100) > 12) {
  //     int endTimeHours = (endTime / 100).round() - 12;
  //     int endTimeMinutes = endTime % 100;
  //     totalEndTime = "$endTimeHours:$endTimeMinutes";
  //     print(totalEndTime);
  //   } else {
  //     int endTimeHour = (endTime / 100).round();
  //     int endTimeMinutes = endTime % 100;
  //     totalEndTime = "$endTimeHour: ${endTimeMinutes}";
  //     print(totalEndTime);
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  SharedPreferences prefs;
  getTeacherId() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString("teacherId");
  }

  @override
  Widget build(BuildContext context) {
    // formatTime();
    return InkWell(
      onTap: () {
        getCurrentClassStudents(widget.id);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => StudentsTabBar(
                      id: widget.id,
                      classroomName: widget.name,
                      standard: widget.standard,
                    )));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(
          right: 15,
          top: 10,
          bottom: 10,
          left: 10,
        ),
        elevation: 7,
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/classroom.jpg'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: _loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${widget.numOfStudents} Students',
                            style: TextStyle(
                              color: Colors.amber[900],
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Class ${widget.standard}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "${widget.startTiming} - ${widget.endTiming} ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 40,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Confirm'),
                                content: Text(
                                    'Do you want to delete the classroom?'),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        _loading = true;
                                      });
                                      currentTeacherClassrooms
                                          .remove(widget.id);
                                      Firestore.instance
                                          .collection('Teachers')
                                          .document(currentTeacherId)
                                          .updateData({
                                        'classrooms': currentTeacherClassrooms,
                                      }).then((v) {
                                        Firestore.instance
                                            .collection('Classrooms')
                                            .where('uid', isEqualTo: widget.id)
                                            .getDocuments()
                                            .then((value) {
                                          value.documents.forEach((element) {
                                            element.reference.delete();
                                          });
                                        });
                                      }).then((v) {
                                        var query = Firestore.instance
                                            .collection('Students')
                                            .where('classID',
                                                isEqualTo: widget.id)
                                            .getDocuments()
                                            .then((value) => {
                                                  value.documents
                                                      .forEach((element) {
                                                    element.reference.delete();
                                                  })
                                                });
                                        setState(() {
                                          _loading = false;
                                        });
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
