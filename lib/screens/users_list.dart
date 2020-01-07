import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samayakuri2/models/user.dart';

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
            ? Center(child: CircularProgressIndicator())
            : Text('hope this is working ${user.users.length}'),
      ),
    );
  }
}
