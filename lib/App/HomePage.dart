// ignore_for_file: prefer_const_constructors, deprecated_member_use, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mo_time_tracker/services/Auth.dart';

class HomePage extends StatelessWidget {
  final Authbase auth;
  Future<void> _logOut() async {
    await auth.signOut();
  }

  const HomePage({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          FlatButton(
              onPressed: _logOut,
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
