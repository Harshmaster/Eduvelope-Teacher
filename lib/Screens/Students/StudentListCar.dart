import 'package:flutter/material.dart';

class StudentListCard extends StatefulWidget {
  final String name;
  final String id;
  final int standard;
  final String batch;

  StudentListCard({
    this.name,
    this.batch,
    this.id,
    this.standard,
  });

  @override
  _StudentListCardState createState() => _StudentListCardState();
}

class _StudentListCardState extends State<StudentListCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
      ),
    );
  }
}
