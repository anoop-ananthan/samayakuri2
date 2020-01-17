import 'package:flutter/material.dart';
import 'package:samayakuri2/data/store.dart';
import 'package:samayakuri2/models/user.dart';
import 'package:samayakuri2/globals.dart' as globals;

class UsersListScreen extends StatelessWidget {
  final AppStore store = globals.store;
  UsersListScreen();

  @override
  Widget build(BuildContext context) {
    final List<User> users = store.users;
    return Scaffold(
      appBar: AppBar(
        title: Text('The Blue Warriors'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, i) {
          return ListTile(
            onTap: () {
              store.profileUser = users[i];
              Navigator.pushNamed(context, '/profile');
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(users[i].photoUrl),
            ),
            title: Text(users[i].name),
            subtitle: Text(users[i].role),
            trailing: Text(
              users[i].isPresent ? 'In' : 'Out',
              style: TextStyle(
                  color: users[i].isPresent
                      ? Colors.greenAccent
                      : Colors.redAccent),
            ),
          );
        },
      ),
    );
  }
}
