//import 'package:path/path.dart';
//import 'package:sqflite/sqflite.dart';

import 'logs_page.dart';

class Log extends Object {
  String body;

  Log(this.body);

  save() async {
    DateTime now = new DateTime.now();
    lastAction += ("command $body ran at $now \n");
    print("log saved");
  }
}