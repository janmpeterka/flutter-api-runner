import 'package:apirunner/settings_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:apirunner/command.dart';


class TogglSettings {
//  static const PID_PROJECT_MAINTENANCE = 149366203;
  static var apiToken = "placeholdertoken";
  String url = "https://" + apiToken + ":api_token@www.toggl.com";

  factory TogglSettings._() => null;
}

class TogglGetCurrent extends GetCommand {
  TogglGetCurrent(String name) : super(name);
  static final apiUrl = "/api/v8/time_entries/current";

  @override
  Future<String> run() async {
    String token = await this.getShared();
    String url = "https://" + token + ":api_token@www.toggl.com";
    this.completeUrl = (url + apiUrl);
    return super.run();
  }

  @override
  Future<String> parseData(responseBody) async {
    return responseBody['data']['id'].toString();
  }
}

class TogglStartTimeEntry extends PostCommand with TogglSettings {
  TogglStartTimeEntry(String name) : super(name);
  static final apiUrl = "/api/v8/time_entries/start";

  var body =
//      '{"time_entry":{"description":"Flutter test", "pid":${TogglSettings.PID_PROJECT_MAINTENANCE}, "created_with":"flutter" }}';
      '{"time_entry":{"description":"Flutter test", "created_with":"flutter" }}';

  @override
  Future<String> run() async {
    String token = await this.getShared();
    String url = "https://" + token + ":api_token@www.toggl.com";
    this.completeUrl = (url + apiUrl);
    return super.run();
  }
}

class TogglStopEntry extends PutCommand with TogglSettings {
  TogglStopEntry(String name) : super(name);

  static final apiUrl = "/api/v8/time_entries/{time_entry_id}/stop";

  @override
  Future<String> run() async{
    String token = await this.getShared();
    String url = "https://" + token + ":api_token@www.toggl.com";
    String currentEntry = await TogglGetCurrent("placeholder").run();
    this.completeUrl = (url + apiUrl).replaceAll("{time_entry_id}", currentEntry);
    return super.run();
  }

}
