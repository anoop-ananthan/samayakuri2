import 'package:flutter/material.dart';

class Timing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 300,
          width: 300,
          child: Text(
            "Timing",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          color: Colors.amber,
        ),
      ),
    );
  }
}
