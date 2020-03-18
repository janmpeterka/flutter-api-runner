import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class Command extends Object {
  String name;

  Command(this.name);

  // ignore: missing_return
  Future<String> run() async {}

  Future<String> getShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getString('togglToken') ?? "not in memory");
  }
}

class GetCommand extends Command {
  GetCommand(String name) : super(name);
  String completeUrl;

  @override
  Future<String> run() async {
    var response = await this._getResponse();
    print(response);
    return response;
  }

  Future<String> _getResponse() async {
    print(this.completeUrl);
    var response = await http.get(this.completeUrl);
    var responseBody = json.decode(response.body.toString());
    var returnValue = this.parseData(responseBody);
    return returnValue;
  }

  Future<String> parseData(responseBody) async {
    return "error: calling general class GetCommand";
  }
}

class PostCommand extends Command {
  PostCommand(String name) : super(name);
  String completeUrl;
  String body;

  @override
  Future<String> run() async {
    print("starting");
    var response = await this._getResponse();
    return response;
  }

  Future<String> _getResponse() async {
    print(this.body);
    var response =
        await http.post(this.completeUrl, body: this.body);
    var responseBody = json.decode(response.body.toString());
    var returnValue = this.parseData(response);
    return returnValue;
  }

  Future<String> parseData(response) async {
    int responseCode = response.statusCode;
    if (responseCode == 200){
      return "$name successful";
    } else {
      return "Something wrong happened.";
    }
  }
}

class PutCommand extends Command {
  PutCommand(String name) : super(name);
  String completeUrl;

  @override
  Future<String> run() async {
    print("starting");
    var response = await this._getResponse();
    return response;
  }

  Future<String> _getResponse() async {
    var response =
    await http.put(this.completeUrl);
    var responseBody = json.decode(response.body.toString());
    var returnValue = this.parseData(response);
    return returnValue;
  }

  Future<String> parseData(response) async {
    int responseCode = response.statusCode;
    if (responseCode == 200){
      return "${name} successful";
    } else {
      return "Something wrong happened.";
    }
  }
}
