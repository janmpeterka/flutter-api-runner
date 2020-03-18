import 'dart:ffi';

import 'package:flutter/material.dart';

import 'toggl.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SettingsForm extends StatefulWidget {
  SettingsForm({Key key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  String togglToken;

  final _togglTokenController = TextEditingController();

  _setLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      this.togglToken = (prefs.getString('togglToken') ?? "not in memory");
    });
    print("local set:" + this.togglToken);
  }

  _setShared(newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('togglToken', newValue);
    print("shared set:" + prefs.getString('togglToken'));
  }

  Future<String> _getShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getString('togglToken') ?? "not in memory");
  }

  @override
  void initState() {
    super.initState();
    _setLocal().then((value){
      print('Async done');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _togglTokenController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your API key';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () async {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                  print(this.togglToken);
                  _setShared(_togglTokenController.text);
                  print(_togglTokenController.text);
                  _setLocal();
                  print(this.togglToken);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
