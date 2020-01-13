import 'package:flutter/material.dart';
import 'package:samayakuri2/data/store.dart';
import 'package:samayakuri2/screens/login/login_background.dart';
import 'package:toast/toast.dart';

final appStore = AppStore();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username;

  void initState() {
    super.initState();
    this.fetcUsersFromApi();
    print('> init');
  }

  void fetcUsersFromApi() async {
    await appStore.getUsers();
    print("> got the users from the API ${appStore.users}");
  }

  onLoginButtonClicked() {
    if (checkIfUserExists())
      Navigator.pushReplacementNamed(context, '/users_list');
    else
      showToast("Invalid username");
  }

  checkIfUserExists() {
    try {
      print('> check function');
      print("> ${appStore.users}");
      if (appStore.users.length == 0) return;
      for (var u in appStore.users) {
        if (u.username == username) {
          print('Successful login!');
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              LoginBackground(
                screenHeight: MediaQuery.of(context).size.height,
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, right: 15),
                    child: Text('Samayakuri',
                        style: Theme.of(context).textTheme.title),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              onChanged: (text) {
                username = text;
              },
              decoration: InputDecoration(
                  labelText: "Username",
                  hintText: "Enter your username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(),
                  ),
                  fillColor: Colors.green),
              validator: (val) {
                if (val.length == 0) return "Please enter your username";
                return null;
              },
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.all(20.0),
            child: FlatButton(
              onPressed: onLoginButtonClicked,
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              color: Colors.green,
              child: Text(
                'Login',
                style: Theme.of(context)
                    .textTheme
                    .title
                    .apply(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Disclaimer: This is not an offical application. This doesnot reflect any official responsibility, imposition or authority on or by the users. This application is developed strictly for academic purpose.",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showToast(String msg) {
    Toast.show(msg, context, backgroundRadius: 5, backgroundColor: Colors.red);
  }
}
