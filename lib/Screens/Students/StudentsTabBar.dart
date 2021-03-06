import 'package:eduvelopeV2/Screens/Students/AddStudents.dart';
import 'package:eduvelopeV2/Screens/Students/AllStudents.dart';
import 'package:eduvelopeV2/globalData.dart';
import 'package:flutter/material.dart';

class StudentsTabBar extends StatefulWidget {
  final String id;
  final String classroomName;
  final int standard;
  StudentsTabBar({
    this.id,
    this.classroomName,
    this.standard,
  });
  @override
  _StudentsTabBarState createState() => _StudentsTabBarState();
}

class _StudentsTabBarState extends State<StudentsTabBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(90),
              child: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                title: Text(currentTeacherName),
                backgroundColor: Colors.blue[900],
                elevation: 0,
                bottom: TabBar(
                    labelColor: Colors.amber[900],
                    unselectedLabelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.white),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("All Students"),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Add Student"),
                        ),
                      ),
                    ]),
              ),
            ),
            body: TabBarView(children: [
              AllStudents(
                id: widget.id,
                name: widget.classroomName,
                standard: widget.standard,
              ),
              AddStudents(
                className: widget.classroomName,
                standard: widget.standard,
                id: widget.id,
              ),
            ]),
          ),
        ));
  }
}
