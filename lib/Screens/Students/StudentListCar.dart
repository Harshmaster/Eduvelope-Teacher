import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduvelopeV2/Screens/Students/localData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class StudentListCard extends StatefulWidget {
  final String classuid;
  final String uid;
  final String name;
  final String id;
  final int standard;

  StudentListCard({
    this.classuid,
    this.uid,
    this.name,
    this.id,
    this.standard,
  });

  @override
  _StudentListCardState createState() => _StudentListCardState();
}

class _StudentListCardState extends State<StudentListCard> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            try {
              setState(() {
                _loading = true;
              });
              Firestore.instance
                  .collection('Students')
                  .where('uniqueID', isEqualTo: widget.uid)
                  .getDocuments()
                  .then((value) {
                value.documents.forEach((element) {
                  element.reference.delete();
                });
              }).then((v) {
                currentClassStudents.remove(widget.uid);
                Firestore.instance
                    .collection('Classrooms')
                    .where('uid', isEqualTo: widget.classuid)
                    .getDocuments()
                    .then((value) {
                  value.documents.forEach((element) {
                    element.reference.updateData({
                      'students': currentClassStudents,
                    });
                  });
                });
              }).then((value) {
                setState(() {
                  _loading = false;
                });
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Alert'),
                      content: Text('Student Deleted'),
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
              });
            } catch (err) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Error'),
                    content: Text(err.message),
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
            }
          },
        ),
      ],
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
              image: AssetImage('assets/Student.jpg'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: _loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
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
                            'ID: ${widget.id}',
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
                            'RANKER BATCH',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
