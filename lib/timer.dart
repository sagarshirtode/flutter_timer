import 'dart:async';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:timer/myapp.dart';

class TimerDemo extends StatefulWidget {
  @override
  _TimerDemoState createState() => _TimerDemoState();
}

class _TimerDemoState extends State<TimerDemo> {
  int hh = 0;
  int mm = 10;
  int ss = 20;
  String timetodisplay = "";
  bool started = true;
  bool stoped = true;
  int timefortimer;
  bool canceltimer = false;

  void hhvalue(value) {
    setState(() {
      hh = value;
    });
  }

  void start() {
    setState(() {
      started = false;
      stoped = false;
    });
    timefortimer = ((hh * 3600) + (mm * 60) + ss);
    // debugPrint(timefortimer.toString());
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (timefortimer < 1 || canceltimer == true) {
          t.cancel();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ));
        } else {
          timefortimer = timefortimer - 1;
          // timetodisplay = timefortimer.toString();
          final now = Duration(seconds: timefortimer);
          timetodisplay = now.toString();
          // print("$now");
        }
      });
    });
  }

  void stop() {
    setState(() {
      started = true;
      stoped = true;
      canceltimer = true;
      timetodisplay = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        // color: Colors.black54,
        child: Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "HH",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          NumberPicker(
                              minValue: 0,
                              maxValue: 23,
                              value: hh,
                              onChanged: (value) {
                                hhvalue(value);
                              }),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "MM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          NumberPicker(
                              minValue: 0,
                              maxValue: 23,
                              value: mm,
                              onChanged: (value) {
                                setState(() {
                                  mm = value;
                                });
                              }),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "SS",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          NumberPicker(
                              minValue: 0,
                              maxValue: 23,
                              value: ss,
                              onChanged: (value) {
                                setState(() {
                                  ss = value;
                                });
                              }),
                        ],
                      )
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    "$timetodisplay",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
                  )),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ignore: deprecated_member_use
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: started ? start : null,
                            child: Text("START"),
                          ),
                        ),
                        // ignore: deprecated_member_use
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: stoped ? null : stop,
                            child: Text("STOP"),
                          ),
                        ),
                      ],
                    ),
                  ))
            ]),
      ),
    )

        // child: RaisedButton(
        //   // textColor: Colors.red,
        //   color: Colors.red,
        //   splashColor: Colors.cyan,
        //   elevation: 20.0,
        //   shape: Border.all(width: 2.0, color: Colors.red),
        //   padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        //   child: Text(
        //     "Sagar Shirtode",
        //     style: TextStyle(color: Colors.red),
        //   ),
        //   // splashColor: Colors.blue,
        // ),
        // child: FlatButton(
        //   // color: Colors.red,
        //   splashColor: Colors.cyan,
        //   // textColor: Colors.green,
        //   onPressed: () {
        //     print("Hello");
        //   },
        //   child: Text(
        //     "Save",
        //     style: TextStyle(fontSize: 24.0),
        //   ),
        //   // child: Icon(Icons.edit),
        //   // child: Image.asset("btn.png"),
        //   // color: Colors.amber,
        // ),

        );
  }
}
