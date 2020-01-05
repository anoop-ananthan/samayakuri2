import 'dart:convert';
import 'package:http/http.dart' as http;

/// User class defines all the employees of the establishment
class User {
  String username;
  String name;
  String role;
  int totalPunch;
  String firstPunch;
  String lastPunch;
  int durationInsideOfficeInSeconds;
  int durationOutsideOfficeInSeconds;
  int totalTimeSpentAfterFirstPunchInSeconds;
  String punchDate;
  String photoUrl;
  bool isPresent;

  User(
      {this.username,
      this.name,
      this.role,
      this.totalPunch,
      this.firstPunch,
      this.lastPunch,
      this.durationInsideOfficeInSeconds,
      this.durationOutsideOfficeInSeconds,
      this.totalTimeSpentAfterFirstPunchInSeconds,
      this.punchDate,
      this.isPresent,
      this.photoUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'] as String,
        name: json['fullname'] as String,
        role: json['userrole'] as String,
        totalPunch: json['totalPunch'] as int,
        firstPunch: json['firstPunch'] as String,
        lastPunch: json['lastPunch'] as String,
        durationInsideOfficeInSeconds:
            json['durationInsideOfficeInSeconds'] as int,
        durationOutsideOfficeInSeconds:
            json['durationOutsideOfficeInSeconds'] as int,
        totalTimeSpentAfterFirstPunchInSeconds:
            json['totalTimeSpentAfterFirstPunchInSeconds'] as int,
        punchDate: json['punchDate'] as String,
        isPresent: json['status'].toString() == 'In',
        photoUrl: json['picture'] as String);
  }

  static Future<List<User>> getUsers() async {
    print("> here am I");
    const url = 'http://bhipms.net/index.php?r=punchresult/DailyPunchApi';
    final response = await http.get(url);
    var userList = (json.decode(response.body) as List)
        .map<User>((u) => User.fromJson(u))
        .toList();
    userList.sort((a, b) => a.name.compareTo(b.name));

    return userList;
  }
}
