import 'package:flutter/material.dart';
import 'package:samayakuri2/screens/login/login.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/login',
        routes: {'/login': (context) => LoginScreen()},
      ),
    );
