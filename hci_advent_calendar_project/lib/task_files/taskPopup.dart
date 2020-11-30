import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_advent_calendar_project/firebase_files/firebaseMain.dart';
import 'package:hci_advent_calendar_project/main_backend/mainArea.dart';
import 'package:hci_advent_calendar_project/task_files/taskPage.dart';

class TaskPopup extends StatelessWidget{

  String title;
  String description;
  int points;
  String id;

  TaskPopup(this.title, this.description, this.points, this.id);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 24.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      content: Container(
        width: 260.0,
        height: 230.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // dialog top
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(vertical: 10.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff),
            ),
            // dialog centre
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description: " + description),
                  Text("Points: " + points.toString()),
                ],
              ),
              flex: 2,
            ),

            // dialog bottom
            Expanded(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red),
                ),
                onPressed: () {
                  FirebaseMain().updateComplete(FirebaseFirestore.instance.collection(fbUser.uid).doc("1").collection("tasks").doc(id));
                  FirebaseMain().addPointsToTotal(FirebaseFirestore.instance.collection(fbUser.uid).doc("familyData"), points);
                  FirebaseMain().updateUniversalData(points);
                  getFamilyPoints();
                  Navigator.pop(context);
                },
                child: Text(
                  "Done",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}