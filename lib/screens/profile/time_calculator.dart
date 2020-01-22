import 'package:flutter/material.dart';

import 'package:samayakuri2/globals.dart' as globals;

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globals.calculator.firstPunch = DateTime.parse("2020-01-15 09:00:00");
    globals.calculator.breakTime = Duration(minutes: 15);
    // globals.store.currentUser.timeForBreak as Duration;

    return Expanded(
      child: Text(globals.store.currentUser.name),
    );
  }
}
