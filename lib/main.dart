import 'package:flutter/material.dart';
import 'package:samayakuri2/data/store.dart';
import 'package:samayakuri2/screens/login/login.dart';
import 'package:samayakuri2/screens/profile.dart';
import 'package:samayakuri2/screens/users_list.dart';

final AppStore store = AppStore();

void main() => runApp(
      MaterialApp(
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/users_list': (context) => UsersListScreen(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
