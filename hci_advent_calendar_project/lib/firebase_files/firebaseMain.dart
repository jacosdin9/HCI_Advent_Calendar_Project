import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hci_advent_calendar_project/main_backend/mainArea.dart';

class FirebaseMain{
  static FirebaseFirestore firestoreDB = FirebaseFirestore.instance;

  //ADD DOC TO COLLECTION
  Future<void> addTestDoc(CollectionReference cr){
    return cr.
    add({
      'hello' : "Hey",
    }).
    then((value) => print("DOC ADDED")).
    catchError((error) => print("FAILED TO ADD DOC: $error"));
  }

  //UPDATE COMPLETE FIELD TO TRUE
  Future<void> updateComplete(DocumentReference dr){
      return dr.update({'complete': true}).
      then((value) => print("COMPLETE FIELD UPDATED")).
      catchError((error) => print("FAILED TO UPDATE DOC: $error"));
  }

  Future<void> addPointsToTotal(DocumentReference dr, int pointsToAdd){
    return dr.update({'totalPoints': familyPoints + pointsToAdd}).
    then((value) => print("TOTAL POINTS FIELD UPDATED")).
    catchError((error) => print("FAILED TO UPDATE DOC: $error"));
  }
  
  Future<void> addToUniversalData(){
    CollectionReference cr = FirebaseFirestore.instance.collection("universalData");
    return cr.doc(fbUser.uid).set(
      {
        "totalPoints" : 0,
      }
    );
  }

  Future<void> updateUniversalData(int pointsToAdd){
    DocumentReference dr = FirebaseFirestore.instance.collection("universalData").doc(fbUser.uid);
    return dr.update({'totalPoints': familyPoints + pointsToAdd}).
    then((value) => print("TOTAL POINTS FIELD UPDATED")).
    catchError((error) => print("FAILED TO UPDATE DOC: $error"));
  }
}