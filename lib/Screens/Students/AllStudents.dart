import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:eduvelopeV2/Screens/Students/StudentListCar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllStudents extends StatefulWidget {
  final String name;
  final int standard;
  AllStudents({this.name, this.standard});
  @override
  _AllStudentsState createState() => _AllStudentsState();
}

class _AllStudentsState extends State<AllStudents> {
  SharedPreferences prefs;

  getTeacherId() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString("teacherId");
  }

  @override
  Widget build(BuildContext context) {
    print(widget.name);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: getTeacherId(),
            builder: (context, myFuture) {
              return StreamBuilder(
                stream: Firestore.instance
                    .collection("Teachers")
                    .document(myFuture.data)
                    .collection("Classrooms")
                    .document(widget.name)
                    .collection("Students")
                    .snapshots(),
                builder: (context, snap) {
                  if (snap.data != null) {
                    return Container(
                      child: Column(
                          children: List.generate(snap.data.documents.length,
                              (index) {
                        return StudentListCard(
                          name: snap.data.documents[index].data["studentName"],
                          batch: widget.name,
                          id: snap.data.documents[index].data["studentId"],
                          standard: widget.standard,
                        );
                      })),
                    );
                  } else {
                    return Container();
                  }
                },
              );
            }),
      ),
    );
  }
}
