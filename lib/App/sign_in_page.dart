// ignore_for_file: prefer_const_constructors, duplicate_ignore, deprecated_member_use
import 'package:mo_time_tracker/CommonWidgets/custom_raised_button.dart';

import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mo Tracker'),
        elevation: 4.0,
      ),
      body: _buildContent(),
      backgroundColor: Color.fromARGB(255, 51, 93, 199),
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
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            CustomRaisedButton(
              borderRadius: 15,
              color: Colors.white,
              onPressed: () {
                _signInWithGoogle();
              },
              child: Text("Sign in with Google",
                  style: TextStyle(
                    color: Colors.black87,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(
              height: 8,
            ),
            CustomRaisedButton(
              color: Colors.deepOrange,
              onPressed: _signInWithGoogle,
              borderRadius: 15,
              child: Text("Sign in with Facebook",
                  style: TextStyle(
                    color: Colors.black87,
                    fontStyle: FontStyle.normal,
                  )),
            )
          ],
        ));
  }

  void _signInWithGoogle() {}
}
