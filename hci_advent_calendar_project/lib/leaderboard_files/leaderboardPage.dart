import 'package:cloud_firestore/cloud_firestore.dart';
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


<<<<<<< HEAD
=======
class LeaderboardPage extends StatefulWidget{
  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  List familyScores;

  @override
  void initState() {
    super.initState();
  }

>>>>>>> 81b5e3b97f74a6179456fc27edabed58df61efe5
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

Future<List> getFamilyPoints() async {
  CollectionReference dr = FirebaseFirestore.instance.collection("universalData");
  return dr.get().then((querySnapshot) {
    querySnapshot.docs.forEach((value) {
      print(fbUser.uid + ": " + value.get("totalPoints"));
    });
  }).catchError((onError){
    print("ERROR");
  });
}