import 'dart:async';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class WatchWidget extends StatefulWidget {
  @override
  _WatchWidgetState createState() => _WatchWidgetState();
}

class _WatchWidgetState extends State<WatchWidget> {
  String name0;
  String name = "Strong boy";
  void disp() {
    setState(() {
      name = name0;
    });
  }

  @override
  void initState() {
    super.initState();
    debugPrint("Running..............");
    Timer(Duration(seconds: 3), finish);
  }

  void finish() {
    debugPrint("Finish");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row Column testing"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("$name"),
          RaisedButton(
            onPressed: () {},
            child: Text("Button"),
          ),
          Icon(Icons.edit),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (data) {
                name0 = data;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Please enter your name",
                  helperText: "name please",
                  labelText: "Full name",
                  prefixIcon: Icon(Icons.account_balance)),
              maxLines: 2,
              maxLength: 10,
              cursorColor: Colors.red,
              autofocus: true,
              style: TextStyle(color: Colors.red, fontSize: 20.0),
            ),
          ),
          RaisedButton(onPressed: disp),
        ],
      ),
    );
  }
}
