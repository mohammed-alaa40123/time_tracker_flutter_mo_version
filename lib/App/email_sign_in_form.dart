// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mo_time_tracker/App/sign_in_button.dart';
import 'package:mo_time_tracker/CommonWidgets/custom_raised_button.dart';

class EmailSigninForm extends StatelessWidget {
  const EmailSigninForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: _buildChildren(),
        ),
      ),
    );
  }

  List<Widget> _buildChildren() {
    return [
      TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'text@test.com',
        ),
      ),
      SizedBox(
        height: 8,
      ),
      TextField(
        decoration: const InputDecoration(labelText: 'Password'),
        obscureText: true,
      ),
      SizedBox(
        height: 8,
      ),
      CustomRaisedButton(
        onPressed: () {},
        color: Colors.blueAccent,
        borderRadius: (5),
        child: Text('Sign in',
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      SizedBox(
        height: 8,
      ),
      FlatButton(onPressed: () {}, child: Text('Need an account? Register'))
    ];
  }
}
