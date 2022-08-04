// ignore_for_file: prefer_const_constructors, deprecated_member_use, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mo_time_tracker/services/Auth.dart';

class HomePage extends StatelessWidget {
  final Authbase auth;

  const HomePage({Key? key, required this.auth}) : super(key: key);

  Future<void> _confirmSignOut(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Log Out"),
            content: Text("Are You sure You want to logout?"),
            actions: [
              FlatButton(
                  onPressed: () {
                    auth.signOut();
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok")),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancel"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Home Page"),
        actions: [
          FlatButton(
              onPressed: () => _confirmSignOut(context),
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Color(0xFFfad0c4),
                ),
              ))
        ],
      ),
    );
  }
}
