import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:samayakuri2/models/user.dart';

class UserService {
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
