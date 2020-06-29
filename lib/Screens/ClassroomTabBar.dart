import 'package:eduvelopeV2/Screens/AllClassrooms.dart';
import 'package:eduvelopeV2/Screens/CreateClassroom.dart';
import 'package:flutter/material.dart';

class ClassroomTabBar extends StatefulWidget {
  @override
  _ClassroomTabBarState createState() => _ClassroomTabBarState();
}

class _ClassroomTabBarState extends State<ClassroomTabBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50), 
            child: AppBar(
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
                        child: Text("All Classrooms"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Create New"), 
                      ),
                    ),
                  ]),
            ),
          ),
          body: TabBarView(children: [
            AllClassrooms(),
            CreateClassroom(),
          ]),
        ));
  }
}
