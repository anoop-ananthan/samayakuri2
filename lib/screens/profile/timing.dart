import 'package:flutter/material.dart';
import 'package:samayakuri2/data/store.dart';
import 'package:samayakuri2/globals.dart' as globals;
import 'package:samayakuri2/models/user.dart';

class Timing extends StatelessWidget {
  final AppStore store = globals.store;

  @override
  Widget build(BuildContext context) {
    final User user = store.profileUser;
    return Expanded(
      child: ListView(
        children: ListTile.divideTiles(
          color: Colors.grey[400],
          tiles: [
            ListTile(
              leading: Icon(
                Icons.gavel,
                color: Colors.brown,
              ),
              title: Text('First punch'),
              subtitle: Text(user.firstPunch ?? 'Not arrived'),
            ),
            ListTile(
              leading: Icon(
                Icons.access_time,
                color: Colors.purple,
              ),
              title: Text(
                'Total time',
              ),
              subtitle: Text(user.totalTime ?? ''),
            ),
            ListTile(
              leading: Icon(
                Icons.laptop_mac,
                color: Colors.indigo,
              ),
              title: Text(
                'Time in office',
              ),
              subtitle: Text(user.timeInOffice ?? ''),
            ),
            ListTile(
              leading: Icon(Icons.fastfood, color: Colors.pink),
              title: Text('Break time'),
              subtitle: Text(user.timeForBreak ?? ''),
            )
          ],
        ).toList(),
      ),
    );
  }
}
