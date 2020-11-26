import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              ],
            ),
          )
      ),
    );
  }

}