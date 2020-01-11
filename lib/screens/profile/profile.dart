import 'package:flutter/material.dart';
import 'package:samayakuri2/models/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  ProfileScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
        title: Text(
          user.name,
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
