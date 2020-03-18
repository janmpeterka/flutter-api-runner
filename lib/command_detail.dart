import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'command.dart';

class CommandDetail extends StatefulWidget {
  @override
  CommandDetailState createState() => CommandDetailState();
}

class CommandDetailState extends State<CommandDetail> {
  @override
  Widget build(BuildContext context) {
    Command command = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(command.name),
      ),
      body: Text(command.name),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var response = command.run();
          Fluttertoast.showToast(
              msg: await response,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1);
        },
        tooltip: 'Run command',
        child: const Icon(Icons.trending_flat),
      ),
    );
  }
}
