// ignore_for_file: prefer_const_constructors, duplicate_ignore, deprecated_member_use, prefer_const_literals_to_create_immutables, avoid_print

import 'package:mo_time_tracker/App/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:mo_time_tracker/CommonWidgets/custom_raised_button.dart';
import 'package:mo_time_tracker/services/Auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key, required this.auth}) : super(key: key);
  final Authbase auth;

  Future<void> _signInAnonomously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mo Tracker',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 250, 243, 221),
            fontWeight: FontWeight.bold,
            fontFamily: "Splash",
          ),
        ),
        elevation: 4.0,
      ),
      body: _buildContent(),
      backgroundColor: Color.fromARGB(255, 250, 243, 221),
    );
  }

  Widget _buildContent() {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Sign in",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Splash",
                  color: Color(0xFFF44336)),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInButton(
                  color: Color.fromARGB(255, 250, 243, 221),
                  textColor: Colors.red,
                  onPressed: _signInWithGoogle,
                  text: "    Sign in with Google    ",
                  asset: 'assets/images/google.png',
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            SignInButton(
              color: Color.fromRGBO(56, 71, 230, 1),
              textColor: Color.fromARGB(255, 250, 243, 221),
              onPressed: _signInWithGoogle,
              text: "Sign in with Facebook",
              asset: 'assets/images/facebookpngjpg copy.png',
            ),
            SizedBox(
              height: 12,
            ),
            CustomRaisedButton(
                borderRadius: 15,
                width: 100,
                height: 20,
                color: Colors.red,
                onPressed: _signInAnonomously,
                child: Text("Go Anonymous",
                    style: TextStyle(
                      color: Color.fromARGB(255, 250, 243, 221),
                      fontFamily: "Forte",
                      fontStyle: FontStyle.normal,
                    ))),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Or",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontFamily: "Splash",
                  ),
                ),
                InkWell(
                    onTap: _signInWithGoogle,
                    child: Text(
                      "    Create an account  ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 56, 71, 230),
                          fontFamily: "Forte",
                          fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        ));
  }
}
