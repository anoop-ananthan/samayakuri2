import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Align(
              alignment: Alignment.topRight,
              child: Text('Home', style: Theme.of(context).textTheme.display1)),
        ),
      ),
    );
  }
}
