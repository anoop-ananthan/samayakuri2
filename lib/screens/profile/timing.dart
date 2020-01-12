import 'package:flutter/material.dart';

class Timing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: ListTile.divideTiles(
          color: Colors.grey[400],
          tiles: [
            ListTile(
              leading: Icon(
                Icons.gavel,
                color: Colors.brown,
              ),
              title: Text(
                'First punch',
              ),
              subtitle: Text('9:30 am'),
            ),
            ListTile(
              leading: Icon(
                Icons.access_time,
                color: Colors.purple,
              ),
              title: Text(
                'Total time',
              ),
              subtitle: Text('1:30'),
            ),
            ListTile(
              leading: Icon(
                Icons.laptop_mac,
                color: Colors.indigo,
              ),
              title: Text(
                'Time in office',
              ),
              subtitle: Text('1:15'),
            ),
            ListTile(
              leading: Icon(Icons.fastfood, color: Colors.pink),
              title: Text('Break time'),
              subtitle: Text('0:15'),
            )
          ],
        ).toList(),
      ),
    );
  }
}
