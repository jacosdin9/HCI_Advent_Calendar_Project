import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_advent_calendar_project/calendar_files/calendarPage.dart';
import 'package:hci_advent_calendar_project/leaderboard_files/leaderboardPage.dart';
import 'package:hci_advent_calendar_project/task_files/taskPage.dart';

User fbUser;
int familyPoints;

class MainArea extends StatefulWidget {

  @override
  _MainAreaState createState() => _MainAreaState();
}

class _MainAreaState extends State<MainArea> {
  _MainAreaState();

  int _currentIndex = 1;
  final List<Widget> _children = [
    CalendarPage(),
    TaskPage(),
    LeaderboardPage(),
  ];

  @override
  initState(){
    super.initState();
    fbUser = FirebaseAuth.instance.currentUser;
    getFamilyPoints();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: fbUser == null ? Text('PRESCRIPTION MANAGEMENT') : Text("LOGGED IN AS: " + fbUser.email.toString()),
        ),

        //WHAT IS CURRENTLY BEING DISPLAYED
        body: _children[_currentIndex],

        //TAB SWITCHER
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.calendar_today),
              label: "Calendar",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: 'Leaderboard',
            )
          ],
        ),
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

getFamilyPoints() async {
  DocumentReference dr = FirebaseFirestore.instance.collection(fbUser.uid).doc("familyData");
  DocumentSnapshot doc = await dr.get();

  if(doc.exists){
    familyPoints = doc.get("totalPoints");
    print(familyPoints);
  }
  else{
    print("cannot find total points");
    familyPoints = null;
  }
}