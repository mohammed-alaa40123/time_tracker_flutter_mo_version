// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mo_time_tracker/App/email_sign_in_form.dart';

class EmailSignInPage extends StatelessWidget {
  const EmailSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mo Tracker',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFfad0c4),
            fontWeight: FontWeight.bold,
            fontFamily: "Splash",
          ),
        ),
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(child: EmailSigninForm()),
      ),
      backgroundColor: Color(0xFFfad0c4),
    );
  }
}
