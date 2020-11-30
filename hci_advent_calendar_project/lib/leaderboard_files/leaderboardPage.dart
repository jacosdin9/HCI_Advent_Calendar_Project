import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_advent_calendar_project/main_backend/mainArea.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Leaderboard page"),
        Text("Total family points: " + familyPoints.toString()),

        //sign out button
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