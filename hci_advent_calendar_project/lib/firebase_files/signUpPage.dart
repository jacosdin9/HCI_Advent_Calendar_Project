import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_advent_calendar_project/firebase_files/firebaseAuthentication.dart';
import 'package:provider/provider.dart';

import 'firebaseMain.dart';

class SignUpPage extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 50),
                //EMAIL INPUT
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email Address",
                          hintText: "Enter email address",
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if(value.isEmpty){
                            return "Please enter a valid email address.";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),

                //PASSWORD INPUT
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter password",
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if(value.isEmpty){
                            return "Please enter a valid password";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),

                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red),
                  ),
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                  onPressed: () async {
                    FirebaseMain().addToUniversalData();
                    await context.read<FirebaseAuthentication>().signUp(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                    Navigator.pop(context);
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            //CANCEL BUTTON
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                heroTag: "FAB1",
                backgroundColor: Colors.red,
                child: Icon(Icons.cancel),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}