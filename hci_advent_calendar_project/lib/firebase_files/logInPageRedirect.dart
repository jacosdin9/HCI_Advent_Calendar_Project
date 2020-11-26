import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_advent_calendar_project/firebase_files/firebaseAuthentication.dart';
import 'package:hci_advent_calendar_project/main_backend/mainArea.dart';
import 'package:provider/provider.dart';
import 'logInPage.dart';

class LogInPageRedirect extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthentication>(
          create: (_) => FirebaseAuthentication(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthentication>().authStateChanges,
        )
      ],

      child: MaterialApp(
        title: "Log-in redirect",
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget{
  const AuthenticationWrapper({
    Key key,
  }) : super (key:key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    fbUser = firebaseUser;

    //if user is logged in
    if(firebaseUser != null){
      return MainArea();
    }

    //if user is not logged in
    else{
      fbUser = null;
      return LogInPage();
    }
  }

}