import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'CalendarClient.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CalendarClient calendarClient = CalendarClient();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(Duration(days: 1));
  TextEditingController _eventName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2021, 8, 17, 00, 00),
                      maxTime: DateTime(2200, 12, 31, 00, 00),
                      onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    setState(() {
                      this.startTime = date;
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.tw);
                },
                child: Text('Event Start Time'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.lightBlue,
                ),
              ),
              Text('  $startTime'),
            ],
          ),
          Row(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2021, 8, 17, 00, 00),
                      maxTime: DateTime(2200, 12, 31, 00, 00),
                      onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    setState(() {
                      this.endTime = date;
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.tw);
                },
                child: Text(
                  'Event End Time',
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.lightBlue,
                ),
              ),
              Text('   $endTime')
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _eventName,
              decoration: InputDecoration(hintText: 'Enter Event Name'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Text('$_eventName, $startTime, $endTime');
            },
            child: Text('Insert Event'),
          ),
        ],
      ),
    );
  }
}
