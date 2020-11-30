import 'package:flutter/material.dart';
import 'package:hci_advent_calendar_project/task_files/taskPopup.dart';

class TaskCard extends StatelessWidget {

  String title;
  String description;
  int points;
  String id;
  bool complete;

  TaskCard(this.title, this.description, this.points, this.id, this.complete);

  @override
  Widget build(BuildContext context) {

    final taskThumbnail = Container(
      margin: EdgeInsets.symmetric(
          vertical: 16.0
      ),
      alignment: FractionalOffset.centerLeft,
      child: RawMaterialButton(
        onPressed: () {},
        elevation: 0.0,
        fillColor: Colors.amber,
        child: Icon(
          Icons.album,
          size: 40.0,
        ),
        padding: EdgeInsets.all(25.0),
        shape: CircleBorder(),
      ),
    );

    final taskCardContent = Container(
      margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text(title),
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
        onTap: () {
          var popUp = TaskPopup(title, description, points, id);

          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context){
              return popUp;
            },
          );
        },
        child: Container(
          child: taskCardContent,
          height: 124.0,
          margin: EdgeInsets.only(left: 46.0),
          decoration: BoxDecoration(
            color: complete==false ? Colors.red : Colors.green,
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
            taskThumbnail,
          ],
        )
    );
  }
}