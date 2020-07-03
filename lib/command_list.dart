import 'package:apirunner/command.dart';
import 'package:apirunner/toggl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommandList extends StatefulWidget {
  @override
  CommandListState createState() => CommandListState();
}

class CommandListState extends State<CommandList> {
  List<Command> _commandList = [
//    TogglGetCurrent("Get current"),
    TogglStartTimeEntry("Start new entry"),
    TogglStopEntry("Stop current entry")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Command list'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: (){Navigator.pushNamed(context, "/settings");}),
          IconButton(icon: Icon(Icons.list), onPressed: (){Navigator.pushNamed(context, "/logs");}),
        ],
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      // ignore: missing_return
      itemBuilder: (context, index) {
        if (index < _commandList.length) {
          return _buildRow(_commandList[index]);
        }
      },
    );
  }

  Widget _buildRow(Command command) {
    return ListTile(
      title: Text(command.name.toString()),
      trailing: _buildIcons(command),
        onTap: () async {
        var response = command.run();
        Fluttertoast.showToast(
            msg: await response,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1);
      },
    );
  }

  Widget _buildIcons(Command command) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.pushNamed(context, "/detail", arguments: command);
      },
    );
  }
}
