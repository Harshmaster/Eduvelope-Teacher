import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduvelopeV2/globalData.dart';
import 'package:eduvelopeV2/widgets/classroomListCard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../globalData.dart';

class AllClassrooms extends StatefulWidget {
  @override
  _AllClassroomsState createState() {
    return _AllClassroomsState();
  }
}

class _AllClassroomsState extends State<AllClassrooms> {
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: StreamBuilder(
          initialData: null,
          stream: Firestore.instance.collection("Classrooms").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data != null) {
              return Container(
                child: Column(
                  children:
                      List.generate(snapshot.data.documents.length, (index) {
                    if (snapshot.data.documents[index].data["teacherID"] ==
                        currentTeacherId) {
                      return ClassroomListWidget(
                        id: snapshot.data.documents[index].data["uid"],
                        name: snapshot.data.documents[index].data["className"],
                        standard:
                            snapshot.data.documents[index].data["standard"],
                        startTiming:
                            snapshot.data.documents[index].data["start"],
                        endTiming: snapshot.data.documents[index].data["end"],
                        numOfStudents:
                            snapshot.data.documents[index]['students'].length,
                      );
                    } else {
                      return null;
                    }
                  }).where((element) => element != null).toList(),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
