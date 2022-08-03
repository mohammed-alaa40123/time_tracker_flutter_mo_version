// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, invalid_required_positional_param, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:mo_time_tracker/App/email_sign_in_form.dart';
import 'package:mo_time_tracker/services/Auth.dart';

class EmailSignInPage extends StatelessWidget {
  final Authbase auth;
  EmailSignInPage(@required this.auth);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mo Tracker',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFffeef1),
            fontWeight: FontWeight.bold,
            fontFamily: "Splash",
          ),
        ),
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(child: EmailSigninForm(auth)),
      ),
      backgroundColor: Color(0xFFffeef1),
    );
  }
}
