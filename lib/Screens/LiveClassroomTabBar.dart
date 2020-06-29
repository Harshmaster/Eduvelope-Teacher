import 'package:eduvelopeV2/Screens/LiveClasses.dart';
import 'package:eduvelopeV2/Screens/UpcomingClasses.dart';
import 'package:flutter/material.dart';

class LiveClassroomTabBar extends StatefulWidget {
  @override
  _LiveClassroomTabBarState createState() => _LiveClassroomTabBarState();
}

class _LiveClassroomTabBarState extends State<LiveClassroomTabBar> {
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
                      child: Text("Live"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Upcoming"),
                    ),
                  ),
                ]),
          ),
        ),
        body: TabBarView(children: [
          LiveClasses(),
          UpcomingClasses(),
        ]),
      ),
    );
  }
}
