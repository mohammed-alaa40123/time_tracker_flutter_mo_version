// ignore_for_file: prefer_const_constructors, deprecated_member_use, file_names, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/Auth.dart';

class HomePage extends StatelessWidget {
  Future<void> _confirmSignOut(BuildContext context) async {
    final auth = Provider.of<Authbase>(context, listen: false);

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
