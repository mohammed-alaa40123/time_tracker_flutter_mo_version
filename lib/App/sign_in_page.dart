// ignore_for_file: prefer_const_constructors, duplicate_ignore, deprecated_member_use, prefer_const_literals_to_create_immutables, avoid_print

import 'package:mo_time_tracker/App/email_sign_in_page.dart';
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

  Future<void> _signInWithFacebook() async {
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context, signIn) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) => EmailSignInPage(auth, signIn),
      fullscreenDialog: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mo Tracker',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFFFAEBC),
            fontWeight: FontWeight.bold,
            fontFamily: "Splash",
          ),
        ),
        elevation: 4.0,
      ),
      body: _buildContent(context),
      backgroundColor: Color(0xFFffeef1),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 170,
            ),
            Text(
              "Sign in",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Splash",
                  color: Color(0xFFFFAEBC)),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInButton(
                  color: Color(0xFFFFAEBC),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  onPressed: _signInWithGoogle,
                  text: " Sign in with Google ",
                  asset: 'assets/images/google.png',
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            SignInButton(
              color: Color.fromARGB(255, 255, 255, 255),
              textColor: Colors.blueAccent,
              onPressed: _signInWithFacebook,
              text: "Sign in with Facebook",
              asset: 'assets/images/facebookpng.png',
            ),
            SizedBox(
              height: 12,
            ),
            CustomRaisedButton(
                borderRadius: 15,
                width: 100,
                height: 20,
                color: Colors.blueAccent,
                onPressed: () => _signInWithEmail(context, true),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Sign in with Email",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: "Forte",
                          fontStyle: FontStyle.normal,
                        )),
                    Icon(
                      Icons.email_rounded,
                      color: Color(0xFFFFAEBC),
                    )
                  ],
                )),
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
                    color: Color(0xFFFFAEBC),
                    fontFamily: "Splash",
                  ),
                ),
                InkWell(
                    onTap: () => _signInWithEmail(context, false),
                    child: Text(
                      "    Create an account  ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF448AFF),
                          fontFamily: "Forte",
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CustomRaisedButton(
                borderRadius: 15,
                width: 100,
                height: 20,
                color: Colors.blueAccent,
                onPressed: _signInAnonomously,
                child: Text("Go Anonymous",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: "Forte",
                      fontStyle: FontStyle.normal,
                    ))),
          ],
        ));
  }
}
