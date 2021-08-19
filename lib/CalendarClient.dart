import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer';

class CalendarClient {
  static const _scopes = const [CalendarApi.calendarEventsScope];

  insert(title, startTime, endTime) {
    var _clientID = ClientId(
        "955296504154-0cqvl0fntcbf7cfap05ubmm3nci13tam.apps.googleusercontent.com",
        "");
    clientViaUserConsent(_clientID, _scopes, prompt) // need to change
        .then((AuthClient client) {
      var calendar = CalendarApi(client);
      calendar.calendarList.list().then((value) => print("VAL________$value"));

      String calendarId = "primary";
      Event event = Event(); // create object of event

      event.summary = title;

      EventDateTime start = EventDateTime();
      start.dateTime = startTime;
      start.timeZone = "GMT+05:00";
      event.start = start;

      EventDateTime end = EventDateTime();
      end.dateTime = startTime;
      end.timeZone = "GMT+05:00";
      event.end = end;

      try {
        calendar.events.insert(event, calendarId).then((value) {
          print("ADDEDDD_________________${value.status}");
          if (value.status == "confirmed") {
            log('Event added in google calendar');
          } else {
            log("Unable to add event in google calendar");
          }
        });
      } catch (e) {
        log('Error creating event $e');
      }
    });
  }
}

void prompt(String url) async {
  print("Please go to the following URL and grant access:");
  print("  => $url");
  print("");

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
