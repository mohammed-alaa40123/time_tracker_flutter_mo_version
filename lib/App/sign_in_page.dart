// ignore_for_file: prefer_const_constructors, duplicate_ignore

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
    );
  }
}
