import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_advent_calendar_project/main_backend/mainArea.dart';
import 'package:hci_advent_calendar_project/task_files/taskCard.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {

    CollectionReference taskRef = FirebaseFirestore.instance.collection(fbUser.uid).doc('1').collection("tasks");

    return
      StreamBuilder<QuerySnapshot>(
        stream: taskRef.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          //IF THERE'S AN ERROR:
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          //LOADING STATE:
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var results = snapshot.data.docs;

          //PRINT DATABASE CONTENTS
          return
            Column(
              children: [
                Expanded(
                  child: Container(
                    child: CustomScrollView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: false,
                      slivers: <Widget>[
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 24.0),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                                  (context, index) =>
                                  TaskCard(results[index].get("title"), results[index].get("description"), results[index].get("points"), results[index].id, results[index].get("complete")),
                              childCount: results.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
        },
      );
  }
}