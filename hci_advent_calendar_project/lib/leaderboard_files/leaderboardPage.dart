import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_advent_calendar_project/main_backend/mainArea.dart';
import 'package:hci_advent_calendar_project/leaderboard_files/leaderBoardCell.dart';

class LeaderboardPage extends StatefulWidget{
  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {

  leaderBoardCell a;
  leaderBoardCell b;

  List<leaderBoardCell> list;

  @override
  void initState() {
    super.initState();

    a = leaderBoardCell("Johnston", familyPoints);
    b = leaderBoardCell("Osdin", 78);
    list = [a,b];
    list.sort((b,a)=>a.points.compareTo(b.points));
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Leaderboard page:"),
        leaderBoardCell(list[0].familyName, list[0].points),
        leaderBoardCell(list[1].familyName, list[1].points),
        RaisedButton(
          child: Text("Sign out"),
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
        )
      ],
    );
  }
}