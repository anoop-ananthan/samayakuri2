import 'package:flutter/material.dart';
import 'package:samayakuri2/screens/home_screen.dart';
import 'package:samayakuri2/screens/login/login.dart';
import 'package:samayakuri2/screens/profile.dart';
import 'package:samayakuri2/screens/splash_screen.dart';
import 'package:samayakuri2/screens/time_calc.dart';
import 'package:samayakuri2/screens/users_list.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/login',
        routes: {
          '/home': (context) => HomeScreen(),
          '/splash': (context) => SplashScreen(),
          '/profile': (context) => ProfileScreen(),
          '/time_calc': (context) => TimeCalculatorScreen(),
          '/users_list': (context) => UsersListScreen(),
          '/login': (context) => LoginScreen(),
        },
      ),
    );
