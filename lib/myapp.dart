import 'package:flutter/material.dart';
import 'package:timer/timer.dart';
import 'package:timer/watch.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController tb;

  @override
  void initState() {
    tb = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Watch"),
        bottom: TabBar(
          tabs: <Widget>[Text("Timer"), Text("Watch")],
          controller: tb,
        ),
      ),
      body: TabBarView(
        children: <Widget>[TimerDemo(), WatchWidget()],
        controller: tb,
      ),
    );
  }
}
