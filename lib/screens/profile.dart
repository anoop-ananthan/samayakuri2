import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:samayakuri2/data/store.dart';
import 'package:samayakuri2/models/user.dart';
// import 'package:samayakuri2/screens/profile/punch_log.dart';
// import 'package:samayakuri2/screens/profile/time_calculator.dart';
// import 'package:samayakuri2/screens/profile/timing.dart';
import 'package:samayakuri2/globals.dart' as globals;

class ProfileScreen extends StatelessWidget {
  final AppStore store = globals.store;
  ProfileScreen();

  @override
  Widget build(BuildContext context) {
    final User user = store.profileUser;
    List<Widget> tabs = [
      // Timing(),
      // PunchLog(),
      // Calculator(),
    ];
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.purple,
          title: Text(
            '${user.name} ${store.selectedTabIndex}',
          ),
        ),
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 225,
                  color: Colors.green[200],
                ),
                ClipPath(
                  clipper: CurvedClipper(),
                  child: Container(
                    color: Colors.purple,
                    height: 225,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Center(
                  child: CircleAvatar(
                    radius: 105,
                    backgroundImage: NetworkImage(user.photoUrl),
                  ),
                )
              ],
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: store.selectedTabIndex,
          onTap: (index) {
            try {
              store.selectedTabIndex = index;
              print('> selected index - ${store.selectedTabIndex}');
            } catch (e) {
              print(e);
            }
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * .05, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
