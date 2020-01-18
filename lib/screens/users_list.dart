import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:samayakuri2/data/store.dart';
import 'package:samayakuri2/globals.dart' as globals;
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class UsersListScreen extends StatelessWidget {
  final AppStore store = globals.store;
  UsersListScreen();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.bubble_chart),
          title: Text('Blueberries'),
          actions: <Widget>[
            FlatButton.icon(
              textColor: Colors.white,
              label: Text(DateFormat('MMM d, EE').format(store.selectedDate)),
              icon: Icon(Icons.calendar_today),
              onPressed: () async {
                var selectedDate = await showDatePicker(
                  context: context,
                  initialDate: store.selectedDate,
                  firstDate: DateTime(1998),
                  lastDate: DateTime.now(),
                );
                if (selectedDate != null) {
                  store.selectedDate = selectedDate;
                  Toast.show('Please wait...', context,
                      duration: 1, backgroundRadius: 5);
                  await store.getUsers(date: selectedDate);
                  var dateText =
                      DateFormat("MMM d, EEEE").format(store.selectedDate);
                  Toast.show('Viewing data on $dateText', context,
                      duration: 3,
                      backgroundColor: Colors.green,
                      backgroundRadius: 5);
                }
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: store.users.length,
          itemBuilder: (context, i) {
            return ListTile(
              onTap: () {
                store.profileUser = store.users[i];
                Navigator.pushNamed(context, '/profile');
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(store.users[i].photoUrl),
              ),
              title: Text(store.users[i].name),
              subtitle: Text(store.users[i].role),
              trailing: Text(
                store.users[i].isPresent ? 'In' : 'Out',
                style: TextStyle(
                    color: store.users[i].isPresent
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
