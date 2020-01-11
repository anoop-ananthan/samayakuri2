import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
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
      this.photoUrl});

  List<User> users;

  /// Logged in user
  User currentUser;

  /// User whose profile is selected by current user
  User profileUser;

  void setCurrentUser(User user) {
    currentUser = user;
  }

  void setProfileUser(User user) {
    profileUser = user;
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
        photoUrl: json['picture'] as String);
  }

  void getUsers() async {
    print('> calling getusers()');
    const url = 'http://bhipms.net/index.php?r=punchresult/DailyPunchApi';
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
    const url = 'http://bhipms.net/index.php?r=punchresult/DailyPunchApi';
    final response = await http.get(url);
    var userList = (json.decode(response.body) as List)
        .map<User>((u) => User.fromJson(u))
        .toList();
    userList.sort((a, b) => a.name.compareTo(b.name));
    return userList;
  }
}
