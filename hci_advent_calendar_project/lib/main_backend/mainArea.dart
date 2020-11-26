import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_advent_calendar_project/firebase_files/firebaseMain.dart';

User fbUser;

class MainArea extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Main Area"),
          ),
          body: Center(
            child: Column(
              children: [
                Text("MAIN AREA"),
                RaisedButton(
                  child: Text("Create test document"),
                  onPressed: () {
                    CollectionReference cr = FirebaseFirestore.instance.collection(fbUser.uid);
                    FirebaseMain().addTestDoc(cr);
                  }
                ),

                RaisedButton(
                  child: Text("Sign out"),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                )
              ],
            ),
          )
      ),

    );
  }

}