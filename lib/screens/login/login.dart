import 'package:flutter/material.dart';
import 'package:samayakuri2/screens/login/login_background.dart';

class LoginScreen extends StatelessWidget {
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
              onPressed: () {},
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
}
