import 'package:flutter/material.dart';

import 'settings_form.dart';

class SettingsPage extends StatefulWidget {
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nastavení"),
        ),
        body:
            SettingsForm(),
        );
  }
}