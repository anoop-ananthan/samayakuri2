import 'package:flutter/material.dart';
import 'package:samayakuri2/data/store.dart';
import 'package:samayakuri2/globals.dart' as globals;

class PunchLog extends StatelessWidget {
  final AppStore store = globals.store;

  @override
  Widget build(BuildContext context) {
    return Text(
      "PunchLog",
      style: TextStyle(color: Colors.redAccent, fontSize: 30),
    );
  }
}
