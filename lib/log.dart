//import 'package:path/path.dart';
//import 'package:sqflite/sqflite.dart';

import 'logs_page.dart';

class Log extends Object {
  String body;

  Log(this.body);

  save() async {
    lastAction += (this.body+ "\n");
    print("log saved");
  }
}