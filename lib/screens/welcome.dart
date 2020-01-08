import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Demo mobile app!',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w600, letterSpacing: -2),
            ),
            SizedBox(
              height: 25,
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.filter_1),
              ),
              title: Text('Mobility while capturing complex data'),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.filter_2),
              ),
              title: Text('Simplifying data collecltion'),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.filter_3),
              ),
              title: Text('Attendance in the absense of data collection'),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.filter_4),
              ),
              title: Text('Offline data collection'),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.filter_5),
              ),
              title: Text('Automatic data syncronization'),
            ),
            SizedBox(
              height: 25,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              color: Colors.blue,
              textColor: Colors.white,
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Let\'s get started!',
                    style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
