import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samayakuri2/models/user.dart';
import 'package:samayakuri2/screens/profile/profile.dart';

class UsersListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);

    user.getUsers();

    return Scaffold(
      appBar: AppBar(
        title: Text('Employees'),
      ),
      body: Consumer<User>(
        builder: (context, user, child) => user.users == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: user.users.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    onTap: () {
                      user.setProfileUser(user.users[i]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider.value(
                            child: ProfileScreen(),
                            value: User.profileUser,
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.users[i].photoUrl),
                    ),
                    title: Text(user.users[i].name),
                    subtitle: Text(user.users[i].role),
                    trailing: Text(
                      user.users[i].isPresent ? 'In' : 'Out',
                      style: TextStyle(
                          color: user.users[i].isPresent
                              ? Colors.greenAccent
                              : Colors.redAccent),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
