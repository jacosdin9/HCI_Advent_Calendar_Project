import 'package:flutter/material.dart';
import 'package:hci_advent_calendar_project/task_files/taskPopup.dart';

class leaderBoardCell extends StatelessWidget {

  String familyName;
  int points;

  leaderBoardCell(this.familyName, this.points,);

  @override
  Widget build(BuildContext context) {


    final taskCardContent = Container(
      margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text(familyName),
          Container(height: 7.0),
          Text(points.toString() + " points"),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 18.0,
            color: Color(0xff00c6ff),
          ),

        ],
      ),
    );

    final taskCard = GestureDetector(
        child: Container(
          child: taskCardContent,
          height: 124.0,
          margin: EdgeInsets.only(left: 46.0),
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
        )
    );

    return Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            taskCard,
          ],
        )
    );
  }
}