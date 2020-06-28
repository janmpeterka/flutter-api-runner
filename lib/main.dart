// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'dart:math';

import 'package:apirunner/command_detail.dart';
import 'package:flutter/material.dart';
import 'command_list.dart';
import 'command_detail.dart';
import 'settings_page.dart';
import 'logs_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Run API!',
        theme: ThemeData(
        primaryColor: Colors.black,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => CommandList(),
      '/detail': (context) => CommandDetail(),
      '/settings': (context) => SettingsPage(),
      '/logs': (context) => LogsPage()
    });
  }
}

