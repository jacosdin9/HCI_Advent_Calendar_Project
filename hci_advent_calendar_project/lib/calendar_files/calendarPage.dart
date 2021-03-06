import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

DateTime lastSelectedDay = DateTime.now();
List lastSelectedEvents = [];

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>{

  CalendarController _controller;
  Map<DateTime, List> _events;
  List _selectedEvents;
  DateTime _selectedDay;


  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _selectedEvents = lastSelectedEvents;
    _selectedDay = lastSelectedDay;

    //test events
    _events = {
      DateTime.now().add(Duration(days: -1)): [
        'press ups - Dad',
        'paint a picture - Scott'
      ],
      DateTime.now().add(Duration(days: -2)): [
        'lunges - Emma',
        'make soup - Mum'
        'tidy bedroom - Cammy'
      ],
      DateTime.now().add(Duration(days: -3)): [
        'do 10 kick ups - Scott',
        'relax by having a bath - Mum',
        'zumba class on youtube - Emma',
        'mop kitchen - Dad'
      ],

      DateTime.now().add(Duration(days: 10)):[
        'ISOLATION IS OVER!',
      ]
    };
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    lastSelectedDay = day;
    lastSelectedEvents = events;
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
            calendarController: _controller,
            startingDayOfWeek: StartingDayOfWeek.monday,
            initialCalendarFormat: CalendarFormat.week,
            events: _events,
            onDaySelected: _onDaySelected,
            onCalendarCreated: _onCalendarCreated,
            onVisibleDaysChanged: _onVisibleDaysChanged,
            initialSelectedDay: lastSelectedDay,

            //customise selected date
            calendarStyle: CalendarStyle(
              todayColor: Colors.grey,
              selectedColor: Colors.red,
            ),

            //customise header
            headerStyle: HeaderStyle(
              formatButtonTextStyle:
              TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
              formatButtonDecoration: BoxDecoration(
                color: Colors.deepOrange[400],
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            availableCalendarFormats: const {
              CalendarFormat.month: 'Show Month',
              CalendarFormat.week: 'Show Week',
            }
        ),

        //events displayed here below calendar
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
                      Text(_selectedEvents[index].toString()),

                      childCount: _selectedEvents.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}