import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samayakuri2/models/user.dart';
import 'package:samayakuri2/screens/profile/punch_log.dart';
import 'package:samayakuri2/screens/profile/time_calculator.dart';
import 'package:samayakuri2/screens/profile/timing.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context, listen: false);
    List<Widget> tabs = [
      Timing(),
      PunchLog(),
      Calculator(),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
        title: Text(user.name),
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
          ),
          Consumer<User>(
            builder: (context, user, _) => tabs[user.selectedTabIndex],
          ),
        ],
      ),
      bottomNavigationBar: Consumer<User>(
        builder: (context, user, child) => BottomNavigationBar(
          currentIndex: user.selectedTabIndex,
          onTap: (index) {
            try {
              user.selectedTabIndex = index;
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

// import 'package:flutter/material.dart';
// import 'package:samayakuri2/models/user.dart';

// class ProfileScreen extends StatelessWidget {
//   final User user;

//   ProfileScreen(this.user);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.purple,
//           title: Text(
//             user.name,
//           ),
//         ),
//         body: Column(
//           children: <Widget>[
//             Stack(
//               children: <Widget>[
//                 Container(
//                   height: 225,
//                   color: Colors.green[200],
//                 ),
//                 ClipPath(
//                   clipper: CurvedClipper(),
//                   child: Container(
//                     color: Colors.purple,
//                     height: 225,
//                     width: MediaQuery.of(context).size.width,
//                   ),
//                 ),
//                 Center(
//                   child: CircleAvatar(
//                     radius: 105,
//                     backgroundImage: NetworkImage(user.photoUrl),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//         bottomNavigationBar: NavBar());
//   }
// }

// class NavBar extends StatefulWidget {
//   @override
//   _NavBarState createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Business',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: School',
//       style: optionStyle,
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           title: Text('Home'),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.business),
//           title: Text('Business'),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.school),
//           title: Text('School'),
//         ),
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: Colors.amber[800],
//       onTap: _onItemTapped,
//     );
//   }
// }

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
