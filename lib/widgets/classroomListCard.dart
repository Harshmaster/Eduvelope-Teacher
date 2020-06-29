import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduvelopeV2/Screens/Students/StudentsTabBar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassroomListWidget extends StatefulWidget {
  final String name;
  final int standard;
  final String timing;

  ClassroomListWidget({
    this.name,
    this.standard,
    this.timing,
  });

  @override
  _ClassroomListWidgetState createState() => _ClassroomListWidgetState();
}

class _ClassroomListWidgetState extends State<ClassroomListWidget> {
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
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => StudentsTabBar(
                      classroomName: widget.name,
                      standard: widget.standard,
                    )));
      },
      child: FutureBuilder(
          future: getTeacherId(),
          builder: (context,myFuture) {
            return StreamBuilder(
                stream: Firestore.instance  
                    .collection("Teachers")
                    .document(myFuture.data)
                    .collection("Classrooms")
                    .document(widget.name)
                    .collection("Students")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
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
                                Colors.black.withOpacity(0.5),
                                BlendMode.dstATop),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Column(
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
                                '${snapshot.data.documents.length} Students',
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
                                '${widget.timing}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                });
          }),
    );
  }
}
