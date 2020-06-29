import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduvelopeV2/widgets/classroomListCard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllClassrooms extends StatefulWidget {
  @override
  _AllClassroomsState createState() {
    return _AllClassroomsState();
  }
}

class _AllClassroomsState extends State<AllClassrooms> {
  SharedPreferences prefs;
  getTeacherId() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString("teacherId");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: getTeacherId(),
            builder: (context, myFuture) {
              return StreamBuilder(
                initialData: null,
                stream: Firestore.instance
                    .collection("Teachers")
                    .document(myFuture.data)
                    .collection("Classrooms")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Container(
                      child: Column(
                        children: List.generate(snapshot.data.documents.length,
                            (index) {
                          return ClassroomListWidget(
                            name: snapshot
                                .data.documents[index].data["className"],
                            standard:
                                snapshot.data.documents[index].data["standard"],
                            timing:
                                snapshot.data.documents[index].data["timing"],
                          );
                        }),
                      ),
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
