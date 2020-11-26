import 'package:cloud_firestore/cloud_firestore.dart';

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

}