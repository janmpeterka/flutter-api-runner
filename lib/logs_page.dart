import 'package:flutter/material.dart';

String lastAction = "";

class LogsPage extends StatefulWidget {
  @override
  LogsPageState createState() => LogsPageState();
}

class LogsPageState extends State<LogsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logy"),
      ),
      body:
        Text(lastAction)
    );
  }
}