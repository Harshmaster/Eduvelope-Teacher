import 'package:eduvelopeV2/globalData.dart';
import 'package:eduvelopeV2/widgets/classTile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../globalData.dart';

class LiveClasses extends StatefulWidget {
  @override
  _LiveClassesState createState() => _LiveClassesState();
}

class _LiveClassesState extends State<LiveClasses> {
  SharedPreferences prefs;
  getTeacherId() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString("teacherId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (ctx, fdata) {
          return StreamBuilder(
            builder: (ctx, sdata) {
              if (sdata.connectionState == ConnectionState.waiting) {
                return Icon(Icons.warning);
              }
              print(sdata.data.documents);
              return ListView.builder(
                itemBuilder: (ctx, index) {
                  if (sdata.data.documents[index]['startTiming'] <=
                          int.parse(DateFormat.H().format(DateTime.now())) *
                              100 &&
                      sdata.data.documents[index]['endTiming'] >
                          int.parse(DateFormat.H().format(DateTime.now())) *
                              100 &&
                      (sdata.data.documents[index]['teacherID'] ==
                          currentTeacherId)) {
                    return ClassTile(
                      id: sdata.data.documents[index]['uid'],
                      isLive: true,
                      name: sdata.data.documents[index]['className'],
                      standard: sdata.data.documents[index]['standard'],
                      startTiming: sdata.data.documents[index]['start'],
                      endTiming: sdata.data.documents[index]['end'],
                      numOfStudents:
                          sdata.data.documents[index]['students'].length,
                    );
                  }
                  return SizedBox(
                    width: 0,
                    height: 0,
                  );
                },
                itemCount: sdata.data.documents.length,
              );
            },
            stream: Firestore.instance.collection('Classrooms').snapshots(),
          );
        },
        future: getTeacherId(),
      ),
    );
  }
}
