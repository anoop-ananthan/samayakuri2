import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:samayakuri2/models/punch.dart';

/// User class defines all the employees of the establishment
class User extends ChangeNotifier {
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
  int _selectedTabIndex = 0;
  List<Punch> punchLog;

  String get durationInsideOffice {
    // String prettyTime(DateTime time) => DateFormat('HH:mm').format(time);
    // Duration d = new Duration(seconds: durationInsideOfficeInSeconds);
    // DateTime date = DateTime.fromMicrosecondsSinceEpoch(durationInsideOfficeInSeconds);
    return '1:15';
  }

  get selectedTabIndex => _selectedTabIndex;

  set selectedTabIndex(int index) {
    if (_selectedTabIndex == index) return;
    print('> selected index change from $_selectedTabIndex to $index');
    _selectedTabIndex = index;
    notifyListeners();
  }

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
      this.punchLog,
      this.photoUrl});

  List<User> users;

  /// Logged in user
  static User _currentUser;
  static User get currentUser => _currentUser;
  static set currentUser(User user) {
    _currentUser = user;
    print('> current user property set ${user.username}');
  }

  /// User whose profile is selected by current user
  static User _profileUser;
  static User get profileUser => _profileUser;

  void setProfileUser(User user) {
    _profileUser = user;
    print('> profile user property set ${_profileUser.username}');
    notifyListeners();
  }

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
        photoUrl: json['picture'] as String,
        punchLog:
            List<Punch>.from(json["punches"].map((x) => Punch.fromJson(x))));
  }

  void getUsers() async {
    print('> calling getusers()');
    const url =
        'http://bhipms.net/index.php?r=punchresult/DailyPunchApi&pdate=2019-12-31';
    final response = await http.get(url);
    var userList = (json.decode(response.body) as List)
        .map<User>((u) => User.fromJson(u))
        .toList();
    userList.sort((a, b) => a.name.compareTo(b.name));
    users = userList.toList();
    notifyListeners();
  }

  @override
  String toString() {
    return this.name;
  }

  Future<List<User>> fetchUsers() async {
    const url =
        'http://bhipms.net/index.php?r=punchresult/DailyPunchApi&pdate=2019-12-31';
    final response = await http.get(url);
    var userList = (json.decode(response.body) as List)
        .map<User>((u) => User.fromJson(u))
        .toList();
    userList.sort((a, b) => a.name.compareTo(b.name));
    return userList;
  }
}
